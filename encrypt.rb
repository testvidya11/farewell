KEY = "i hope in the next ten years there would be no other farewell letter brilliant than this one"

def encrypt(file)
  plain = File.read(ARGV[0])
  encrypted = []

  (0 ... plain.bytesize).each do |i|
    encrypted << (plain.getbyte(i) ^ KEY.getbyte(i % KEY.bytesize))
  end

  encrypted.join(",")
end

puts encrypt ARGV[0]
