require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Click on one of the product to see product detail page" do
    visit root_path
    first('footer').find('a.btn-default').click
    sleep(5)


    save_screenshot

  end

end
