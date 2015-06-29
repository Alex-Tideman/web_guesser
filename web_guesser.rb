require 'sinatra'
require 'sinatra/reloader'

  SECRET_NUMBER = rand(100)

  def check_guess(guess)
    number = SECRET_NUMBER
    if guess.to_i == number
      "You got it right!" + "\n" + "The SECRET NUMBER is #{number}"
    elsif (guess.to_i - number) > 5
      "Way too high!"
    elsif guess.to_i > number
      "Too high!"
    elsif (number - guess.to_i) > 5
      "Way too low"
    elsif guess.to_i < number
      "Too low"
    end
  end

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, :locals => {:message => message}
end


