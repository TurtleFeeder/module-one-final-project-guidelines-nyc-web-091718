require_relative '../config/environment'


def url_ending
    ts = Time.now.getutc.to_i
    ending_hash = Digest::MD5.hexdigest ts.to_s+ENV['PRIV_KEY']+ENV['PUB_KEY']
    ending_url = "ts=#{ts}&apikey=#{ENV['PUB_KEY']}&hash=#{ending_hash}"
    # binding.pry
end
# binding.pry

# url_ending
url = "https://gateway.marvel.com/v1/public/characters?name=Wolverine"
def get_hash(url)
  if url[-1] == '?'
    new_url = url + url_ending
  else
    new_url = "#{url}&#{url_ending}"
  end

  response_string = RestClient.get(new_url)
  response_hash = JSON.parse(response_string)
end

def get_character_info(character)
  url = "https://gateway.marvel.com/v1/public/characters?name=#{character}"
  get_hash(url)
end

def get_character_name(character_hash)
  character_hash['data']['results'][0]['name']
end #end get_character_name

def get_character_description(character_hash)
  description = character_hash['data']['results'][0]['description']
  if description.empty?
    puts "Unfortunately, this character does not have a description."
  else
    puts description
  end

end #end get_character_description

def get_character_comics(character_hash)
  character_hash['data']['results'][0]['comics']['items'].map {|comic| comic['name']}.uniq
end #end get_character_comics
binding.pry
get_character_info('loki')

#TODO: Def get_character_info - this will be the helper method that will give us access to the character data inside (pulling from the characters API)
# Play around with character info to see what other data we can pull!

# DISPLAY CHARACTER NAME
# wolverine['data']['results'][0]['name']
# DISPLAY CHARACTER DESCRIPTION
# wolverine['data']['results'][0]['description']
#LIST OF ALL THE CHARACTER'S COMICS
# wolverine['data']['results'][0]['comics']['items'].map {|comic| comic['name']}.uniq


#TODO: Def get_comics_info - this will be the helper method that will give us access to the comic data (pulling from the comics API)

#TODO: Def get_series_info - this will be the helper method that will give us access to the series data (pulling from the series API)


## USER STORIES TO WORK TOWARDS
# -As a User I want to search for a list of comics so i can create a reading list
# CLI option to work towards: Do you want to add to your list?
# -As a User I want to search for a super hero so i can see all the comics they were featured in
# -As a User I want to search by comics so i can see all superheroes featured
# -As a User I want to search by comic series so i can see all the volumes
# -As a User I want to search by series so i can see all the issues.
