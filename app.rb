require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/item')
require('./lib/stylesheets')

get('/') do
  @list = Item.sort()
  @stylesheet = StylesheetManipulator.get_random_stylesheet
  erb(:list)
end

post('/') do
  name = params["name"]
  item = Item.new(name)
  item.save()
  @list = Item.all()
  @stylesheet = StylesheetManipulator.get_random_stylesheet
  erb(:list)
end

get('/items/:id') do
  @item = Item.find(params[:id])
  @item.increase_score
  @stylesheet = StylesheetManipulator.get_random_stylesheet
  erb(:item)
end
