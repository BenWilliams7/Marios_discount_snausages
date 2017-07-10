require "rails_helper"


describe 'process to add a product' do
  it 'adds a product to the database' do
    visit '/'
    click_link 'New Product'
    fill_in 'Name', :with => 'Ganymede'
    fill_in 'Price', :with => 42
    fill_in 'Origin', :with => 'The Eyrie'
    click_on 'Create Product'
    expect(page).to have_content 'Ganymede'
  end

  it 'requires all fields' do
    visit '/'
    click_link 'New Product'
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end
