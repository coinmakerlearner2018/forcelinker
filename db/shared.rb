require 'pg'
  
def run_sql(sql, args = [])
  # connect to ENV_URL or other db
  PG.connect(ENV['DATABASE_URL'] || {dbname: 'GoodFoodHunting'})
  results = conn.exec_params(sql, args)
  conn.close
  results
end
