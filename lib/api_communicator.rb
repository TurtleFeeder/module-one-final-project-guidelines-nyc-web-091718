require_relative '../config/environment'


def url_ending
    ts = Time.now.getutc.to_i
    ending_hash = Digest::MD5.hexdigest ts.to_s+ENV['PRIV_KEY']+ENV['PUB_KEY']
    ending_url = "ts=#{ts}&apikey=#{ENV['PUB_KEY']}&hash=#{ending_hash}"
    # binding.pry
end
# binding.pry

# url_ending
# url = "https://gateway.marvel.com/v1/public/characters?name=Hulk"
def get_hash(url)
  if url[-1] == '?'
    new_url = url + url_ending
  else
    new_url = "#{url}&#{url_ending}"
  end

  response_string = RestClient.get(new_url)
  response_hash = JSON.parse(response_string)
end
# binding.pry
# get_hash(url)

#TODO: Def get_character_info
      #Play around with character info to see what other data we can pull!
