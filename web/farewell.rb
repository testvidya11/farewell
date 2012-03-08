require 'sinatra'
require 'redcarpet'

KEY = "i hope in the next ten years there would be no other farewell letter brilliant than this one"

def decrypt(content)
  encrypted = content.gsub(/\s/, "").split(",")
  decrypted = []

  encrypted.each_with_index do |c, i|
    decrypted << (c.to_i ^ KEY.getbyte(i % KEY.bytesize))
  end

  decrypted.pack("c*")
end

get '/' do 
  erb :index
end

post '/' do
  tmp = decrypt(params[:encrypted])
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                     :autolink => true,
                                     :space_after_headers => true)
  @decrypted = markdown.render(tmp)
  erb :decrypted
end
