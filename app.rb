require 'sinatra/base'
require 'sinatra/reloader'

class Battle < Sinatra::Base
  enable :sessions

  configure :development do 
    register Sinatra::Reloader
  end

  @@player2_hp = 100
  @@previous_action = nil

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:name1] = params[:name1]
    session[:name2] = params[:name2]
    redirect '/play'
  end

  get '/play' do
    @name1 = session[:name1]
    @name2 = session[:name2]
    erb(:play)
  end

  post '/attack_player2' do
    @@player2_hp -= 10
    @@previous_action = "P2 attacked"
    redirect '/play'
  end

  run! if app_file == $0
end