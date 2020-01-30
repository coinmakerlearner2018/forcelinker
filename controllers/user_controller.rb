


# ===============Create
get '/signup/new' do
  erb :"/users/index"
end


post '/signup/create' do
  @repeat_user_name = false
  @repeat_user_email = false
  @user_password_inconsistent = false

  user_input_name = params[:user_name]
  user_input_email = params[:user_email]
  
  is_user_name_exist = check_user_name_exist(user_input_name)
  is_user_email_exist = check_user_email_exist(user_input_email)

  @user_password = params[:user_password]
  @user_confirmed_password = params[:user_confirmed_password]

  if is_user_name_exist != nil || is_user_email_exist != nil || params[:user_password] != params[:user_confirmed_password]
      if is_user_name_exist != nil
        @repeat_user_name = true 
              
      elsif is_user_email_exist != nil
        @repeat_user_email = true 
      
      elsif @user_password != @user_confirmed_password
        @user_password_inconsistent = true 
        raise @user_confirmed_password.inspect
      end
      return erb :"/users/index"
  end 


 redirect '/'
end

# ========================login==========
post '/login' do
  
      if logged_in?
        # show logout
        # show delete session -> logout
        
<form action="/session" method="delete">

//////<% input type is default as text %>

<input type="hidden" name="_method" value="delete">
<button>Logout</button>
</form>



      else


      sql = "select * from users where email = '#params{:email}';"
      
      result = run_sql(sql)

      if result.count == 1 && Bcrypt::Password.new(result[0]['password_digest']) == params[:password]

          session[:user_id] = result[0]['id']
          

          session[:email] = result[0]['email']  

          redirect '/' 
      else
      
        
        erb :login
      end
      
    end
      
    end 



delete '/session' do
  session[:user_id] = id
  redirect '/'

end 


# _user_name_exist = check_user_name_exist(user_name_input)
#   is_user_email_exist= check_user_email_exist(user_name_input)

#  
      
#     if is_user_name_exist != nil
#         @is_the_same

    
#     elsif is_user_e
# cipher_password(password)
# create_user_account(user_name, user_email, cipher_password)

# create_dish(
#   params[:name], 
#   params[:image_url], 
#   current_user['id']
# )
# redirect "/"

# ismail_exist != nil
# erb '/signup/new'
# end

# get '/dishes/:id' do
#   @dish = find_one_dish_by_id(params[:id])
#   erb :"/dishes/show"
# end

