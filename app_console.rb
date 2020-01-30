require 'bcrypt'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'
require_relative 'models/user_control_function.rb'

get '/signup/new' do

  erb :"/user_account_management/sign_up"
end


post '/signup/create' do
    user_name = params[:user_name]
    user_email = params[:user_email]

  is_user_name_exist = check_user_name_exist(user_name)
  is_user_email_exist= check_user_email_exist(user_email)

  if is_user_name_exist != nil
        

    return 
  end   


#   if is_user_name_exist != nil || is_user_email_exist != nil
      
    
#         @is_the_same

    
#     elsif is_user_email_exist != nil


    


#        erb '/signup/new'
#   end
  
#   cipher_password(password)
#   create_user_account(user_name, user_email, cipher_password)

#   create_dish(
#     params[:name], 
#     params[:image_url], 
#     current_user['id']
#   )
  redirect "/"
end