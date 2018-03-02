require "unirest"

system "clear"
puts "Welcome to the Dictionary App!"
print "Enter a word: "
input_word = gets.chomp

response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
p response.body[0]["text"]
