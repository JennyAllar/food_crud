require 'sinatra/base'

class Application < Sinatra::Application

  def initialize(app=nil)
    super(app)

    # initialize any other instance variables for you
    # application below this comment. One example would be repositories
    # to store things in a database.

  end

  get '/' do
    erb :index, locals: {array_of_foods: DB[:foods].to_a}
  end

  get '/food/new' do
    erb :"food/new"
  end

  post '/food' do
    food_id = params[:id]
    DB[:foods].where(id: food_id).insert(name: params[:name], ethnicity: params[:ethnicity], year_eaten: params[:year_eaten])
    redirect '/'
  end
end