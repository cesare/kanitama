set :user,        "kanitama"
set :domain,      "kanitama.infrapp.arena.ne.jp"
set :rails_env,   "production"
set :deploy_to,   "/home/kanitama/app"

role :web, "kanitama.infrapp.arena.ne.jp"
role :app, "kanitama.infrapp.arena.ne.jp"
role :db,  "kanitama.infrapp.arena.ne.jp", :primary => true
