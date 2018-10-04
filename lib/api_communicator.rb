require_relative '../config/environment'

# HELPER METHODS

# generate Marvel API's required URL ending that combines timestamp, public key, private key, and a MD5 hash of all 3
  def url_ending
    ts = Time.now.getutc.to_i
    ending_hash = Digest::MD5.hexdigest ts.to_s+ENV['PRIV_KEY']+ENV['PUB_KEY']
    ending_url = "ts=#{ts}&apikey=#{ENV['PUB_KEY']}&hash=#{ending_hash}"
  end

# completes the Marvel API URL by combining the root section with the result of the url_ending method.
# root section ex. https://gateway.marvel.com/v1/public/characters?name=
  def get_hash(url)
    if url[-1] == '?'
      new_url = url + url_ending
    else
      new_url = "#{url}&#{url_ending}"
    end
    response_string = RestClient.get(new_url)
    response_hash = JSON.parse(response_string)
  end #end get_hash

# gets character info hash from character's API
  def get_char_info(character)
    url = "https://gateway.marvel.com/v1/public/characters?name=#{character}"
    hash = get_hash(url)
  end #end of character_info

  # gets character name
def get_char_name(character_hash)
  character_hash['data']['results'][0]['name']
end #end get_character_name

  #gets character description
def get_char_desc(character_hash)
  description = character_hash['data']['results'][0]['description']
  if description.empty?
    puts "Unfortunately, this character does not have a description."
  else
    puts description
  end
end #end get_character_description

  # gets 20 comics from character hash
  def get_char_comics(character_hash)
    character_hash['data']['results'][0]['comics']['items'].map {|comic| comic['name']}.uniq
  end #end get_character_comics

  # FEATURES TO BE IMPLEMENTED IN NEXT VERSION
  # def get_char_series(char_hash)
  #   char_hash['data']['results'][0]['series']
  # end

  # def get_comic_info(comic)
  #   url = "https://gateway.marvel.com:443/v1/public/comics?title=#{comic}"
  #   get_hash(url)
  # end


  # def get_comic_title(comic_hash)
  #   comic_hash["data"]["results"].map {|comic| comic["title"]}.uniq
  # end
