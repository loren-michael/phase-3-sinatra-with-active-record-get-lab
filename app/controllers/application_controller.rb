class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'
  
  # add routes
  get '/bakeries' do
    # get all bakeries from the database
    bakeries = Bakery.all
    # send them back as a json array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    #get a bakery using the ID from the params
    bakery = Bakery.find(params[:id])
    # send them back as json
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    # get all baked goods ordered by price
    baked_goods_price = BakedGood.by_price
    # convert to json
    baked_goods_price.to_json
  end

  get '/baked_goods/most_expensive' do
    most_expensive = BakedGood.by_price.first

    most_expensive.to_json
  end

end
