require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/item')
require('./lib/stylesheets')

get('/') do
  @list = Item.sort
  @stylesheet = StylesheetManipulator.get_random_stylesheet
  erb(:list)
end

post('/') do
  name = params["name"]
  item = Item.new(name)
  @error = ""
  if(item.valid?)
    item.save()
  else
    @error = "This item already exists in your list!"
  end
  @list = Item.sort
  @stylesheet = StylesheetManipulator.get_random_stylesheet
  erb(:list)
end

get('/items/:id') do
  @item = Item.find(params[:id])
  @item.increase_score
  @stylesheet = StylesheetManipulator.get_random_stylesheet
  erb(:item)
end
