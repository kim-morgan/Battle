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

  post '/attack' do
    @game = $game
    @game.attack(@game.opponent, params[:attack].to_i)
    if @game.over? 
      redirect '/gameover'
    else
      redirect '/play'
    end
  end

  get '/gameover' do
    @game = $game
    erb(:gameover)
  end

  run! if app_file == $0
end