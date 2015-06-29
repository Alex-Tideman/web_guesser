require 'sinatra'
require 'sinatra/reloader'

  SECRET_NUMBER = rand(100)

  def check_guess(guess)
    number = SECRET_NUMBER
    if guess.to_i == number
      ["You got it right!" + "\n" + "The SECRET NUMBER is #{number}", "green"]
    elsif (guess.to_i - number) > 5
      ["Way too high!", "red"]
    elsif guess.to_i > number
      ["Too high!", "indianred"]
    elsif (number - guess.to_i) > 5
      ["Way too low", "red"]
    elsif guess.to_i < number
      ["Too low", "indianred"]
    end
  end

get '/' do
  guess = params['guess']
  message = check_guess(guess).first
  color = check_guess(guess).last
  erb :index, :locals => {:message => message,
                          :color => color}
end


