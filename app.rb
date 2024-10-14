require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end
#######################################
get("/square/new") do
  
  erb(:square)
end
get("/square/results") do
  @number = params.fetch("users_number").to_i
  @result = @number ** 2
  erb(:square_results)
end
###############################
get("/square_root/new") do
  erb(:square_root)
end
get("/square_root/results") do
  @user_number = params.fetch("user_number").to_f
  @result = Math.sqrt(@user_number)  
  erb(:square_root_result)
end
#################################

get("/payment/new") do
  erb(:payment)
end
get("/payment/results") do
  erb(:payment_results)
end
get("/random/new") do
  erb(:random)
end
