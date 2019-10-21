require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    cat = Category.find_or_create_by! name: 'General'
    product = cat.products.create!({
      name:  'product_name',
      quantity: 10,
      price: 64.99
    })

    it 'is valid with valid attributes' do 
      expect(product).to be_valid
    end

    it 'is not valid without a name' do 
      product.name = nil
      expect(product).to_not be_valid
    end

    it 'is not valid without a price' do 
      product.price = nil
      expect(product).to_not be_valid
    end

    it 'is not valid without a quantity' do 
      product.quantity = nil
      expect(product).to_not be_valid
    end

    it 'is not valid without a category' do
      cat = nil
      expect(product).to_not be_valid
    end
  end
end


