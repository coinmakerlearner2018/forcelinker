require 'bcrypt'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'

enable :sessions 

require_relative 'models/user_functions.rb'
require_relative 'controllers/user_controller.rb'
require_relative 'db/shared.rb'

# also_reload './models/user_function.rb'



get '/' do
  erb :index
end
