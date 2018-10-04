# define method to save comic selected by user into their reading list
  # def find_or_create_user using the find_or_create_by() method **DONE TODO**
  # def find_or_create_comic using the find_or_create_by() method **DONE TODO**
  # def find_or_create_reading_list using the find_or_create_by() method **DONE TODO**

# define methods for reading_list section in request_command method
  # def display_list method - displays titles of comics **DONE TODO**

# define method to prompt user in CLI
  # def request_user_name - puts welcome msg & requests for user's name - it would use find_or_create_by to either create a new user or pull up the user's account **DONE TODO**
  # def request_command - puts what would you like to do? if search it calls search_option method. if reading_list it calls list_option method.
  # def search_option method - puts out what would you like to search by? 'character', 'comic title', 'series title' HACK **JUMP STRAIGHT TO GET_CHAR_NAME**
  # def list_option method - puts out please choose one: 'see list', 'delete from list', 'delete list'
    # see list - calls display_list method
  # def request_char_name - puts out please enter character name, saves get.chomp into variable, and calls get_character_info on the variable. **DONE TODO**
  # def display_char_info - calls the get_char_name, get_char_desc, get_char_comics **DONE TODO**
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

# api_communicator NOTE:

#search by comic and see all superheroes


#TODO: Def get_comics_info - this will be the helper method that will give us access to the comic data (pulling from the comics API)
# def get_comic_summary (if it exists)
# def get_comic_characters (if it exists)
#TODO: Def get_series_info - this will be the helper method that will give us access to the series data (pulling from the series API)
# def get_series_title


## USER STORIES TO WORK TOWARDS
# -As a User I want to search for a list of comics so i can create a reading list
# CLI option to work towards: Do you want to add to your list?
# -As a User I want to search for a super hero so i can see all the comics they were featured in
# -As a User I want to search by comics so i can see all superheroes featured
# -As a User I want to search by comic series so i can see all the volumes
# -As a User I want to search by series so i can see all the issues.
#TODO: Allow user to pull up their reading list
# Allow user to remove a comic from their reading list
