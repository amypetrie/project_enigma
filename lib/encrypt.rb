#runner file, takes two command line arguments:
#1. message.txt -> contains msg
#2. encrypted.txt -> write encrypted msg here
# => output is < Created 'encrypted.txt' with the key 82648 and date 240818 >
require './lib/enigma'
require './lib/key'
require './lib/offset'
require 'date'

# ARGV == ["message.txt", "encrypted.txt"]

reader_file = File.open(ARGV[0], "r")
incoming_text = reader_file.read
reader_file.close

e = Enigma.new
k = Key.new
d = Date.today
o = Offset.new(d)

encrypted_text = e.encrypt(incoming_text.strip, k)

writer_file = File.open("encrypted.txt", "w")
writer_file.write(encrypted_text)
writer_file.close

p "Created #{ARGV[1]} with key #{k.key_numbers} and date #{o.final_date_offset}"
