require 'koala.rb'
require 'net/http'
require 'yaml'

apiKey = YAML.load_file('facebookapi.yml')["key"]

#Setup graph so that I can post from my account to CIS@PENN
@graph = Koala::Facebook::API.new(apiKey)

previousPos = 137

url = URI.parse('http://almamater.xkcd.com/best.csv')
req = Net::HTTP::Get.new(url.to_s)

while(true)
  res = Net::HTTP::start(url.host, url.port) {|http| http.request(req)}
  split = res.body.split("\n")
  nameArray = split.collect{|e| e.split(",").first}
  scoreArray = split.collect{|e| e.split(",").last}
  position = nameArray.index("\"upenn.edu\"")
  score = scoreArray[position].delete("\"")

  message = "UPenn is currently in position #{position}, with a score of #{score}. The delta position is #{position - previousPos}."
  previousPos = score
  
  @graph.put_connections("114452511948567","feed",:message => message)
  open('log.out', 'a') { |f|
    f.puts message
  }
  sleep(60*60)
end



