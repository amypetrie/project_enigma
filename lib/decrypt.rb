#runner file, takes four command line arguments:
#1. encrypted.txt -> contains encrypted msg
#2. decrypted.txt -> write decrypted msg here
#3. 5 digit key for decryption (integer)
#4. 6 digit date (integer)
# output => < Created 'decrypted.txt' with the key 82648 and date 240818 >

require './lib/enigma'
require './lib/key'
require './lib/offset'
require 'date'

# ARGV == ["message.txt", "encrypted.txt"]

reader_file = File.open(ARGV[0], "r")
incoming_text = reader_file.read
reader_file.close

e = Enigma.new
k = ARGV[2]
d = Offset.new(ARGV[3])

decrypted_text = e.decrypt(incoming_text.strip, k)

writer_file = File.open(ARGV[1], "w")
writer_file.write(decrypted_text)
writer_file.close

p "Created #{ARGV[1]} with key #{k} and date #{ARGV[3]}"
