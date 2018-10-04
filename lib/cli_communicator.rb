require_relative '../config/environment'

  def find_or_create_user(name)
    User.find_or_create_by(name: name)
  end

  def find_or_create_comic(title)
    Comic.find_or_create_by(title: title)
  end

  def find_or_create_reading_list(user_id, comic_id)
    ReadingList.find_or_create_by(user_id: user_id, comic_id: comic_id)
  end

  def save_option(char_hash)
    puts "Would you like to add a comic to your reading list? (Y/N)"
    response = gets.chomp
    if response == 'Y'
      puts "Please enter FULL comic title: "
      comic_title = gets.chomp
      save_comic
    elsif response == "N"
      puts "Returning back to menu..."
    end
  end

  def save_comic(comic_title, char_hash)
    # char_hash =
    find_or_create_comic
    find_or_create_reading_list
  end

  def display_list(user)
    u1 = User.find_by name: user
    if u1.reading_lists.empty?
      puts "You don't have a reading list."
    else
      u1.reading_lists.each {|rl| puts "Comic Title: #{rl.comic.title}"}
    end
  end

    # def request_user_name - puts welcome msg & requests for user's name - it would use find_or_create_by to either create a new user or pull up the user's account
    def request_user_name
      puts "Please enter your name: "
      name = gets.chomp
    end

  # def request_char_name - puts out please enter character name, saves get.chomp into variable, and calls get_character_info on the variable.
  def request_char_name
    puts "Please enter character name: "
    char_name = gets.chomp
  end

  # def display_char_info - calls the get_char_name, get_char_desc, get_char_comics
  def display_char_info(char_hash)
    puts "NAME: #{get_char_name(char_hash)}"
    puts "DESCRIPTION: "
    puts "#{get_char_desc(char_hash)}"
    puts "COMICS: "
    get_char_comics(char_hash).each {|comic| puts comic}
  end

  # create helper method for workflow to check if character name is valid - if it's not it will go back to prompt_user

  def valid_char_entry(char_name)
    hash = get_char_info(char_name)
    if hash['data']['results'].empty?
      puts "This character cannot be found."
      prompt_user
    else
      hash
    end
  end #end valid_char_entry method

  # def request_command - puts what would you like to do? if search it calls search_option method. if reading_list it calls list_option method.

    def list_option
      puts "Please select a number:
            1. See List
            2. Delete Comic From List
            3. Delete List
            4. Search By Character Name
            5. Exit"
    end

    # we'll have to move this while loop outside of the list_option method
    def prompt_user
      list_option
    choice = ""
    while choice == ""
      choice = gets.chomp
      case choice
      when "1"
        display_list(user.name)
        prompt_user
      when "2"
        #destroy individual record method
        prompt_user
      when "3"
        #destroy_all reading_list method
        prompt_user
      when "4"
        char_name = request_char_name
        # combine the get_char_info & the display_char_info into another helper method
        char_hash = valid_char_entry(char_name)
        display_char_info(char_hash)
        save_option(char_hash)
        # give option to save a comic or not
        prompt_user
      when "5"
        puts "Goodbye"
        break
        # TODO: when testing in pry this error popped when exiting the loop - why?
# NoMethodError: undefined method `[]' for nil:NilClass from /Users/tiff/Development/mod1_labs/module-one-final-project-guidelines-nyc-web-091718/lib/api_communicator.rb:28:in `get_char_name'
      else
        list_option
      end
    end

  end #end prompt_user method
  # binding.pry


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
