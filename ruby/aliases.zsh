alias migrate='rake db:migrate db:test:clone'

alias s="ps aux | grep \"ruby\" | grep "script/rails s" || echo \"You're not running any, dawg.\""

# alias the pretty version of rspec
alias tst='rspec --color --format doc'