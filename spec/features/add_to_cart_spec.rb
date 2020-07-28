require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "Visit homepage and click ADD TO CART buttons for a product" do
    visit root_path
    expect(page).to have_text "My Cart (0)"
    if first(".btn").has_no_css?("disabled")
      first(".btn").click
    end
    expect(page).to have_text "My Cart (1)"
    save_screenshot
    
  end
  


end
