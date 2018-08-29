require './lib/enigma'
require './lib/key'
require './lib/offset'
require 'date'

reader_file = File.open(ARGV[0], "r")
incoming_text = reader_file.read
reader_file.close

e = Enigma.new
k = "12345"
d = Date.today
o = Offset.new(d)

encrypted_text = e.encrypt(incoming_text.downcase.strip, k)
writer_file = File.open(ARGV[1], "w")
writer_file.write(encrypted_text)
writer_file.close

p "Created #{ARGV[1]} with key #{k} and date #{o.final_date_offset}"
