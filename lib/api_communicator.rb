require_relative '../config/environment'


def url_ending
    ts = Time.now.getutc.to_i
    # binding.pry
end

url_ending

def get_hash(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end
