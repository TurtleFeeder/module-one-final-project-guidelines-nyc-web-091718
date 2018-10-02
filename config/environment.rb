require 'bundler'
# require 'active_record'
# require 'rake'
# require 'pry'
# require 'rest-client'
# require 'json'
Bundler.require
Dotenv.load

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
require_all 'app'
