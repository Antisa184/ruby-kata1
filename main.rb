require_relative "library"

puts "Welcome to the library!"
puts "\nI'm loading the data..."
lib = Library.new
path =__dir__ + "/data"
lib.loadCsv(path)
puts "Data loaded\n"

i = 0
while i=1 do
  puts "\n1. Print out all books and magazines."
  puts "2. Find a book by its isbn."
  puts "3. Find all books and magazines by their authors' email"
  puts "4. Print out all books and magazines sorted by title."
  puts "\nChoose an option by writing the leading number (e.g. 3)"
  number = gets
  puts "You entered: #{number}"
  if number.strip=="1" then lib.printAll(0)
  elsif number.strip=="2" then lib.findByIsbn
  elsif number.strip=="3" then lib.findByEmail
  elsif number.strip=="4" then lib.printAll(1)
  else puts "Wrong input!\n" end
end
