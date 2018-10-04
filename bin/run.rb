require_relative '../config/environment'
require_relative '../lib/api_communicator'
require_relative '../lib/cli_communicator'

# calling methods for CLI
name = request_user_name
user = find_or_create_user(name)
prompt_user(user)
