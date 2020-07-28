require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
  before :each do
    @category = Category.create! name: "Apparel"
    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 1,
        price: 99
      )
    end
  end

scenario "Can goto the product page from the home page by clicking on a product" do
  visit root_path
  first(".product-name").click
  expect(page).to have_css ".products-show"
  save_screenshot
end


end
