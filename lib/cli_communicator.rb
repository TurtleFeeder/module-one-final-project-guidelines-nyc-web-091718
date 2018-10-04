require_relative '../config/environment'

  # CREATION METHODS
  def find_or_create_user(name)
    User.find_or_create_by(name: name)
  end #end find_or_create_user

  def find_or_create_comic(title)
    Comic.find_or_create_by(title: title)
  end #end find_or_create_comic

  def find_or_create_reading_list(user_id, comic_id)
    ReadingList.find_or_create_by(user_id: user_id, comic_id: comic_id)
  end #end find_or_create_reading_list

# SAVE INTO DATABASE METHOD
  def save_comic(comic_title, u1)
    comic = find_or_create_comic(comic_title)
    find_or_create_reading_list(u1.id, comic.id)
  end #end save_comic

  def save_option(user, char_hash)
    puts "Would you like to add a comic to your reading list? (Y/N)"
    response = gets.chomp.upcase
    if response == 'Y'
      puts "Please enter FULL comic title: "
      comic_title = gets.chomp
      # create method to validate comic_title
      c_title = valid_comic_title(comic_title, char_hash, user)
      u1 = user
        if c_title == nil
          prompt_user(u1)
        else
        save_comic(c_title, u1)
        end #end c_title if stmt
    elsif response == "N"
      puts "Returning back to menu..."
    else
      puts "Invalid Input. Returning to main menu."
      prompt_user(user)
    end #end result if stmt
  end #end save_option

# USER PROMPT METHODS

  def request_user_name
    puts "Please enter your name: "
    name = gets.chomp
  end #end request_user_name

  def request_char_name
    puts "Please enter character name: "
    char_name = gets.chomp
  end #end request_char_name

  def list_option
    puts "Please select a number:
          1. See List
          2. Delete Comic From List
          3. Delete List
          4. Search By Character Name
          5. Exit"
  end #end list_option

  def display_list(user)
    u1 = User.find_by name: user
    if u1.reading_lists.empty?
      puts "You don't have a reading list."
    else
      u1.reading_lists.each {|rl| puts "Comic Title: #{rl.comic.title}"}
    end
  end #end display_list

  # def display_char_info - calls the get_char_name, get_char_desc, get_char_comics
  def display_char_info(char_hash)
    puts "NAME: #{get_char_name(char_hash)}"
    puts "DESCRIPTION: "
    puts "#{get_char_desc(char_hash)}"
    puts "COMICS: "
    get_char_comics(char_hash).each {|comic| puts comic}
  end #end display_char_info

# VALIDATION METHODS
  def valid_char_entry(char_name, user)
    hash = get_char_info(char_name)
    if hash['data']['results'].empty?
      puts "This character cannot be found."
    else
      hash
    end
  end #end valid_char_entry method

  def valid_comic_title(comic_title, char_hash, user)
    comic_array = get_char_comics(char_hash)
    if comic_array.include?(comic_title) == false
      puts "This comic title does not exist."
    else
      comic_title
    end
  end #end valid_char_entry method

  # DELETION METHODS
    def destroy_comic(selected_RL)
      ReadingList.destroy(selected_RL)
      puts "Your comic has been removed from your list."
    end

    def destroy_list(user)
      ReadingList.destroy_all(user_id: user)
      puts "Your reading list has been deleted."
    end

# RUN METHOD
    def prompt_user(user)
      list_option
      choice = ""
    while choice == ""
      choice = gets.chomp
      case choice
      when "1"
        display_list(user.name)
        prompt_user(user)
      when "2"
        puts "Please enter title of comic you wish to delete."
        comic_title = gets.chomp
        # binding.pry
        if user.comics.map {|comic| comic.title}.include?(comic_title) == false
          puts "This comic is not in your list. Returning to main menu."
          prompt_user(user)
        else
          selected_comic = user.comics.select{|comic| comic.title == comic_title}[0]
          selected_RL = ReadingList.all.select {|rl| rl.comic_id == selected_comic.id && rl.user_id == user.id}[0]
          #delete individual record method
          destroy_comic(selected_RL)
        end
        prompt_user(user)
      when "3"
        destroy_list(user)
        prompt_user(user)
      when "4"
        char_name = request_char_name
        char_hash = valid_char_entry(char_name, user)
        #return value of valid_char_entry will be nil if it puts out the "This character cannot be found."
        if char_hash == nil
          prompt_user(user)
        else
          display_char_info(char_hash)
          # give option to save a comic or not
          save_option(user, char_hash)
          puts "Comic has been saved."
        end #end char_hash if stmt
        prompt_user(user)
      when "5"
        puts "Goodbye!!!"
        break
      else
        list_option
      end #end case-when stmt
    end #end while loop
  end #end prompt_user(user) method
