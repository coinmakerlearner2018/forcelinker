# require 'bcrypt'
# require 'sinatra'
# require 'sinatra/reloader'
# require 'pry'
# require 'pg'

# also_reload 'db/shared'

# read
def all_user_name
  sql = "SELECT user_name FROM users;"
  # implicit return
  run_sql(sql)
end

def all_user_email
  sql = "SELECT user_email FROM users;"
  # implicit return
  run_sql(sql)
end
  
# nil
def check_user_name_exist(user_name_input)
  sql = "SELECT user_name FROM users where user_name = '#{user_name_input}';"
  result = run_sql(sql)
  result.values[0]
end   

# nil
def check_user_email_exist(user_name_input)
  sql = "SELECT user_name FROM users where user_name = '#{user_name_input}';"
  result = run_sql(sql)
  result.values[0]
end   
  # create
  
def cipher_password(password)
  cipher_password = BCrypt::Password.create(password)

end

def create_user_account(user_name, user_email, cipher_password)
        sql = <<~SQL
        INSERT INTO users 
        (user_name, user_email, cipher_password)
        VALUES
        ($1, $2, $3);
        SQL
        run_sql(sql, [user_name, user_email, cipher_password])

end 



  def create_user(user_name, user_email, password)
    password_digest = BCrypt::Password.create(password)
  
    sql = <<~SQL
      INSERT INTO users 
      (user_name, user_email, password_digest)
      VALUES
      ($1, $2, $3);
    SQL
    run_sql(sql, [user_name, user_email, password])
  end
  
# =============login===============

  def logged_in?
    if  session[:user_id]
      return true
    else
      return false
    end 
  end 

def current_user_email
  # To give me the actual hash
  
        session[:user_id]

              # The variable must be ->  like   $123 
              # dollar sign is vaildate SQL 

              
            $1 ->  variable number 1    $2 variable number 2 
      

    sql = "select * from users where id = $1 and id = $2 "
    run_sql_safe_mode(sql, [params[:id]]).first['email']
    run_sql_safe_mode("select * from users where id = $1 and id = $2", ["haha", "haha2"]).first['email']

    
    run_sql("select * from users where id = #{session[:user_id]; }")[0]['email']
    
    @dish = run_sql(sql, [params[:id]]).first   -> .first is [0] first record of collection

end 
  
# ===============login================
  # delete - todo
  # update - todo