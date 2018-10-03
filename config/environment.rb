require 'bundler'
require 'digest'
# require 'active_record'
# require 'rake'
# require 'pry'
# binding.pry
# require 'rest-client'
# require 'json'
Bundler.require
Dotenv.load

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'app'
require_all 'lib'
