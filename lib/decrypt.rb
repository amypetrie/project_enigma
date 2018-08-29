require './lib/enigma'
require './lib/key'
require './lib/offset'
require 'date'

reader_file = File.open(ARGV[0], "r")
incoming_text = reader_file.read
reader_file.close

e = Enigma.new
k = ARGV[2]

decrypted_text = e.decrypt(incoming_text.strip, k)

writer_file = File.open(ARGV[1], "w")
writer_file.write(decrypted_text)
writer_file.close

p "Created #{ARGV[1]} with key #{k} and date #{ARGV[3]}"
