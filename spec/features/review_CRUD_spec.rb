require "rails_helper"

describe 'process to add a review ' do
  it 'adds a review to a product' do
    snausage = Product.create(:name => 'Oraon', :price => 42, :origin => 'The Vale of Arryn')
    visit product_path(snausage)
    click_link 'Add a review'
    fill_in 'Author', :with => 'Bucephalus'
    fill_in 'Content body', :with => 'This snausage was amazing. Easily the most unique taste/palate experience I have ever encountered. Wow.'
    fill_in 'Rating', :with => 5
    click_on 'Create Review'
    expect(page).to have_content 'Wow'
  end

  it 'gives an error for a blank field' do
    snausage = Product.create(:name => 'Oraon', :price => 42, :origin => 'The Vale of Arryn')
    visit product_path(snausage)
    click_link 'Add a review'
    fill_in 'Author', :with => ''
    fill_in 'Content body', :with => 'This snausage was amazing. Easily the most unique taste/palate experience I have ever encountered. Wow.'
    fill_in 'Rating', :with => 5
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end

  it 'gives an error for a rating  above 5' do
    snausage = Product.create(:name => 'Oraon', :price => 42, :origin => 'The Vale of Arryn')
    visit product_path(snausage)
    click_link 'Add a review'
    fill_in 'Author', :with => 'Bucephalus'
    fill_in 'Content body', :with => 'This snausage was amazing. Easily the most unique taste/palate experience I have ever encountered. Wow.'
    fill_in 'Rating', :with => 42
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end

  it 'gives an error for a rating below 1' do
    snausage = Product.create(:name => 'Oraon', :price => 42, :origin => 'The Vale of Arryn')
    visit product_path(snausage)
    click_link 'Add a review'
    fill_in 'Author', :with => 'Bucephalus'
    fill_in 'Content body', :with => 'This snausage was terrible! Easily the worst  taste/palate experience I have ever encountered. Wow.'
    fill_in 'Rating', :with => 0
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end
end
