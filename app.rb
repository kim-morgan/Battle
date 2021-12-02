require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/player'
require_relative './lib/game'


class Battle < Sinatra::Base
  enable :sessions

  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:name1]),Player.new(params[:name2]))
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

 get '/attack_1' do
    @game = $game
    @game.attack(@game.player1)
    erb(:attack_1)
  end

  get '/attack_2' do
    @game = $game
    @game.attack(@game.player2)
    erb(:attack_2)
  end

  run! if app_file == $0
end