class RSSLogger < SocialLogger

  def initialize(options = {})
    if options.key? 'feeds' && !options['feeds'].empty?
      @feeds = options['feeds']
    end
    options.each_pair do |att_name, att_val|
      instance_variable_set("@#{att_name}", att_val)
    end
    @markdownify ||= true
    @starred ||= true
    @feeds ||= []
    @tags ||= ''
    @tags = "\n\n#{@tags}\n" unless @tags == ''
    @storage ||= 'icloud'
  end
  attr_accessor :feeds, :markdownify, :starred

  def e_sh(str)
    str.to_s.gsub(/(?=[^a-zA-Z0-9_.\/\-\x7F-\xFF\n])/, '\\').gsub(/\n/, "'\n'").sub(/^$/, "''")
  end

  def permalink(uri,redirect_count=0)
    max_redirects = 10
    options = {}
    url = URI.parse(uri)
    http = Net::HTTP.new(url.host, url.port)
    begin
      request = Net::HTTP::Get.new(url.request_uri)
      response = http.request(request)
      response['location'].gsub(/\?utm.*/,'')
    rescue
      puts "Error expanding #{uri}"
      uri
    end
  end

  def log_rss
    sl = DayOne.new(({ 'storage' => @storage }))
    today = Time.now - (60 * 60 * 24)
    @feeds.each do |rss_feed|
      rss_content = ""
      open(rss_feed) do |f|
        rss_content = f.read
      end

      rss = RSS::Parser.parse(rss_content, false)
      rss.items.each { |item|
        item_date = Time.parse(item.pubDate.to_s)
        if item_date > today
          imageurl = false
          unless item.content_encoded.nil?
            image_match = item.content_encoded.match(/src="(http:.*?\.(jpg|png)(\?.*?)?)"/i)
          else
            image_match = item.description.match(/src="(http:.*?\.(jpg|png)(\?.*?)?)"/i)
          end
          imageurl = image_match[1] unless image_match.nil?
          if @markdownify
            content = item.description.markdownify
          else
            content = item.description
          end

          options = {}
          options['content'] = "## [#{item.title}](#{self.permalink(item.link)})\n\n#{content}#{@tags}"
          options['datestamp'] = item.pubDate.utc.iso8601
          options['starred'] = @starred
          options['uuid'] = %x{uuidgen}.gsub(/-/,'').strip
          if imageurl
            sl.to_dayone(options) if sl.save_image(imageurl,options['uuid'])
          else
            sl.to_dayone(options)
          end
        else
          break
        end
      }
    end
  end
end
