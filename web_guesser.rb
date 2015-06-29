require 'sinatra'
require 'sinatra/reloader'

    SECRET_NUMBER = rand(100)

  def check_guess(guess)
    number = SECRET_NUMBER

      if guess.to_i == number
        ["You got it right!","green","yellow","The SECRET NUMBER is #{number}"]
      elsif (guess.to_i - number) > 5
        ["Way too high!", "red", "black"]
      elsif guess.to_i > number
        ["Too high!", "indianred", "black"]
      elsif (number - guess.to_i) > 5
        ["Way too low", "red", "black"]
      elsif guess.to_i < number
        ["Too low", "indianred", "black"]
      end
  end

  get '/' do
    guess = params['guess']
    message = check_guess(guess)[0]
    color = check_guess(guess)[1]
    text_color = check_guess(guess)[2]
    answer = check_guess(guess)[3]

    erb :index, :locals => {:message => message,
                            :color => color,
                            :text_color => text_color,
                            :answer => answer}
  end




