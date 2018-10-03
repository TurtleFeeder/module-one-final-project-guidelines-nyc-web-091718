require_relative '../config/environment'

  def find_or_create_comic(title, series)
    Comic.find_or_create_by(title: title, series: series)
    # binding.pry
  end

# find_or_create_comic("comic", "series")
# Pry.start
# define method to save comic selected by user into their reading list
  # def find_or_create_comic using the find_or_create_by() method
  # def find_or_create_reading_list using the find_or_create_by() method

# define method to prompt user in CLI
  # def request_user_name - puts welcome msg & requests for user's name - it would use find_or_create_by to either create a new user or pull up the user's account
  # def request_command - puts what would you like to do? if search it calls search_option method. if reading_list it calls list_option method.
  # def search_option method - puts out what would you like to search by? 'character', 'comic title', 'series title'
  # def list_option method - puts out please choose one: 'see list', 'delete from list', 'delete list'
    # see list - calls display_list method
  # def request_char_name - puts out please enter character name, saves get.chomp into variable, and calls get_character_info on the variable.
  # def display_char_info - calls the get_char_name, get_char_desc, get_char_comics
  # def add_comic_option - ask user if they want to add comic to their list.
    # YES - prompt user for comic title - check if title is included in the return array of get_char_comics
      # if it is included then call find_or_create_comic method & find_or_create_reading_list method
        # puts display_list method
        # ask user if they want to add another comic from this search
          # YES - returns to add_comic_option method
          # NO - ask user if they want to start a new search
            # YES - returns to search_option method
            # NO - EXIT
      # if it's not prompt user to input valid comic title
    # NO - ask user if they want to start a new search
      # YES - returns to search_option method
      # NO - EXIT
