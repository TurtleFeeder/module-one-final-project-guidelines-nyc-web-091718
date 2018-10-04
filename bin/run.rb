require_relative '../config/environment'
require_relative '../lib/api_communicator'
require_relative '../lib/cli_communicator'

# def request_user_name - puts welcome msg & requests for user's name - it would use find_or_create_by to either create a new user or pull up the user's account
name = request_user_name
user = find_or_create_user(name)


puts "HELLO WORLD"

# binding.pry
