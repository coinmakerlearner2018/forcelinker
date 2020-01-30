require 'bcrypt'
require 'sinatra'
require 'pg'

if development?
  require 'sinatra/reloader'
  require 'pry'
  # also_reload './models/user_function.rb'
end

enable :sessions 

require_relative 'models/user_functions.rb'
require_relative 'controllers/user_controller.rb'
require_relative 'db/shared.rb'



get '/' do
  erb :index
end
