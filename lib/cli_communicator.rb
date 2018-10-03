require_relative '../config/environment'

  def find_or_create_user(name)
    User.find_or_create_by(name: name)
  end

  def find_or_create_comic(title, series)
    Comic.find_or_create_by(title: title, series: series)
  end

  def find_or_create_reading_list(user_id, comic_id)
    ReadingList.find_or_create_by(user_id: user_id, comic_id: comic_id)
  end

  def display_list(user)
    u1 = User.find_by name: user
    if u1.reading_lists.empty?
      puts "You don't have a reading list."
    else
      u1.reading_lists.each {|rl| puts "Comic Title: #{rl.comic.title} Series: #{rl.comic.series}"}
    end
  end

  # def request_char_name - puts out please enter character name, saves get.chomp into variable, and calls get_character_info on the variable.
  # def display_char_info - calls the get_char_name, get_char_desc, get_char_comics
  def request_char_name
    puts "Please enter character name: "
    char_name = gets.chomp
  end

  def display_char_info(char_hash)
    puts "NAME: #{get_char_name(char_hash)}"
    puts "DESCRIPTION: "
    puts "#{get_char_desc(char_hash)}"
    puts "COMICS: "
    get_char_comics(char_hash).each {|comic| puts comic}
  end

  binding.pry


# define method to save comic selected by user into their reading list
  # def find_or_create_user using the find_or_create_by() method *DONE*
  # def find_or_create_comic using the find_or_create_by() method *DONE*
  # def find_or_create_reading_list using the find_or_create_by() method *DONE*

# define methods for reading_list section in request_command method
  # def display_list method - displays titles of comics *DONE*

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
