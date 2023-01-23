class ApplicationController < Sinatra::Base
  set :default_content, 'application/json' 
  # when a GET request is made to /games, we return an array of all the games in our database in JSON format.
  get '/games' do
    # get all games from database 
    games = Game.all.order(:title).limit(10)
    # return json response with array of all game data 
    games.to_json 
  end 

  # use the :id syntax to create a dynamic route 
  get '/games/:id' do 
    # look up the games in db using its id 
    game = Game.find(params[:id])
    # send a json formatted response of the game data 
    # to include data about associated models, use 'include:'
    # look at game model to set up correct assoications set up 
    game.to_json( only: [:id, :title, :genre, :price], include: {reviews: { only: [:comment]}})
    end 

end
