require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    
    before(:each) do
      @category = Category.new(name: @product)
    end

    it 'should save a product with all four fields' do
      @product = Product.new(name: 'test', price: 100, quantity: 1, category: @category)
      expect(@product).to be_valid
    end

    it 'should not save a product without a name' do
      @product = Product.new(name: nil, price: 100, quantity: 1, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save a product without a price' do
      @product = Product.new(name: 'test', quantity: 1, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should not save a product without a quantity' do
      @product = Product.new(name: 'test', price: 100, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save a product without a category' do
      @product = Product.new(name: 'test', price: 100, quantity: 1, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
