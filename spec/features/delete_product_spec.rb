require 'rails_helper'

describe 'process to destroy product' do
  it 'destroy a product in the database' do
    snausage = Product.create(:name => 'Oraon', :price => 42, :origin => 'The Vale of Arryn')
    visit product_path(snausage)
    click_on 'Delete Product'
    expect(page).not_to have_content('Oraon')
  end
end
