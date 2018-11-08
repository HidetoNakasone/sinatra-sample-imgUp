
require "sinatra"
require "sinatra/reloader"

get '/' do

  @imgs_list = []
  # dir = Dir.open("public/up-imgs/")
  dir = Dir.glob("./public/up-imgs/*").map{|path| path.split('/').last }
    dir.each do  |filenames|
      @imgs_list << filenames
  end

  # @imgs_list.delete_at(0)
  # @imgs_list.delete_at(0)
  puts @imgs_list
  erb :top

end

post '/save' do

  @filename = params[:up_img][:filename]
  file = params[:up_img][:tempfile]

  File.open("./public/up-imgs/#{@filename}", 'wb') do |f|
    f.write(file.read)
  end

  redirect "/"

end
