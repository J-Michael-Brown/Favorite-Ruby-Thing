require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('website', {:type => :feature}) do
  it('stores the users favorite things') do
    visit('/')
    fill_in('name', :with => 'Dogs')
    click_button('Go!')
    expect(page).to have_content('Dogs')
  end
  it('opens the users favorite thing') do
    visit('/items/1')
    expect(page).to have_content('Dogs')
  end
end
