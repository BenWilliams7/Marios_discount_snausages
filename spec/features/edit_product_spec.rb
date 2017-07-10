require "rails_helper"

describe 'process to edit a product' do
  it 'edits a product' do
    snausage = Product.create(:name => 'Oraon', :price => 42, :origin => 'The Vale of Arryn')
    visit product_path(snausage)
    click_link 'Edit Snausage'
    fill_in 'Name', :with => 'Orion'
    click_on 'Update Product'
    expect(page).to have_content 'Orion'
  end

  it 'gives an error if a field is left blank' do
    snausage = Product.create(:name => 'Oraon', :price => 42, :origin => 'The Vale of Arryn')
    visit product_path(snausage)
    click_link 'Edit Snausage'
    fill_in 'Name', :with => ''
    click_on 'Update Product'
    expect(page).to have_content 'errors'
  end
end
