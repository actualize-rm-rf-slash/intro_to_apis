require "unirest"

system "clear"
puts "Welcome to the Dictionary App!"

print "Enter a word: "
input_word = gets.chomp

response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
definitions = response.body

response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
pronunciations = response.body

response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
top_example = response.body

puts "DEFINITIONS"
index = 0
definitions.length.times do
  puts "#{index + 1}. #{definitions[index]["text"]}"
  puts
  index = index + 1
end
puts

puts "TOP EXAMPLE"
puts top_example["text"]
puts

puts "PRONUNCIATIONS"
puts pronunciations[0]["raw"]
