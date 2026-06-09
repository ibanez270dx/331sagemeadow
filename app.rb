require 'sinatra'

set :public_folder, File.join(File.dirname(__FILE__), 'public')
set :views, File.join(File.dirname(__FILE__), 'views')

get '/' do
  erb :index
end
