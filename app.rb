require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/player'

class Battle < Sinatra::Base
  enable :sessions

  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1 = Player.new(params[:name1])
    $player2 = Player.new(params[:name2])
    redirect '/play'
  end

  get '/play' do
    @name1 = $player1.read_name
    @name2 = $player2.read_name
    @player2_hp = $player2.read_hp
    erb(:play)
  end

  post '/attack_player2' do
    $player1.attack($player2)
    redirect '/play'
  end

  run! if app_file == $0
end