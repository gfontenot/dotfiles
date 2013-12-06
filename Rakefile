require 'rake'

desc "Hook our dotfiles into system-standard positions."
task :install do
  linkables = Dir.glob('*/**{.symlink}')
  linkables.each do |linkable|
    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      FileUtils.rm_rf(target)
    end

    `ln -s "$PWD/#{linkable}" "#{target}"`
  end

  link_default_gems
end

task :uninstall do
  Dir.glob('**/*.symlink').each do |linkable|

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all symlinks created during installation
    if File.symlink?(target)
      FileUtils.rm(target)
    end

    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"` 
    end

  end
end

task :default => 'install'

# Special case for default gems because uuugggghhhh
def link_default_gems
  target = "#{ENV["HOME"]}/.rbenv/default-gems"

  if File.exists?(target)
    FileUtils.rm_rf(target)
  end

  `ln -s "$PWD/ruby/default-gems.symlink" #{target}`
end
