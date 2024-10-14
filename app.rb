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
  @user_apr = params.fetch("user_apr").to_f.round(2)
  @user_years = params.fetch("user_years").to_i
  @user_pv = params.fetch("user_pv").to_f.round(2)
  
  # Calculate monthly payment directly in the route
  monthly_rate = @user_apr / 12.0 / 100.0
  total_payments = @user_years * 12

  if monthly_rate.zero?
    @monthly_payment = @user_pv / total_payments
  else
    numerator = monthly_rate * (1 + monthly_rate)**total_payments
    denominator = (1 + monthly_rate)**total_payments - 1
    @monthly_payment = @user_pv * (numerator / denominator)
  end
  erb(:payment_results)
end

get("/random/new") do
  erb(:random)
end
