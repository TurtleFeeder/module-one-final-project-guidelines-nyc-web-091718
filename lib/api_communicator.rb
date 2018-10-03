require_relative '../config/environment'

def url_ending
    ts = Time.now.getutc.to_i
    ending_hash = Digest::MD5.hexdigest ts.to_s+ENV['PRIV_KEY']+ENV['PUB_KEY']
    ending_url = "ts=#{ts}&apikey=#{ENV['PUB_KEY']}&hash=#{ending_hash}"
end

# url = "https://gateway.marvel.com/v1/public/characters?name=Wolverine"
def get_hash(url)
  if url[-1] == '?'
    new_url = url + url_ending
  else
    new_url = "#{url}&#{url_ending}"
  end
  response_string = RestClient.get(new_url)
  response_hash = JSON.parse(response_string)
end #end get_hash

  #Gets character info hash from character's API
def get_character_info(character)
  url = "https://gateway.marvel.com/v1/public/characters?name=#{character}"
  hash = get_hash(url)
  if hash['data']['results'].empty?
    puts "This character cannot be found."
  else
    hash
  end
end #end of character_info

  #DISPLAYS character name
def get_character_name(character_hash)
  character_hash['data']['results'][0]['name']
end #end get_character_name

  #DISPLAYS character description
def get_character_description(character_hash)
  description = character_hash['data']['results'][0]['description']
  if description.empty?
    puts "Unfortunately, this character does not have a description."
  else
    puts description
  end
end #end get_character_description

  #DISPLAYS character's TOP 20 comics
def get_character_comics(character_hash)
  character_hash['data']['results'][0]['comics']['items'].map {|comic| comic['title']}.uniq
end #end get_character_comics
  #Maybe sort the list???

def get_comic_info(comic)
  url = "https://gateway.marvel.com:443/v1/public/comics?title=#{comic}"
  get_hash(url)
end

  #DISPLAYS Top 20 Comic titles
def get_comic_title(comic_hash)
  comic_hash["data"]["results"].map {|comic| comic["title"]}.uniq
end


# binding.pry

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
