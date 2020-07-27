require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe "Validations" do
    
    
    
    it "saves new category and product" do
      @test_category = Category.new(name: "TestCat")
      @test_product = Product.new(
        name: "TestProd",
        price: 1000,
        quantity: 1,
        category: @test_category
      )
      @test_category.save
      @test_product.save
      puts @test_product.errors.full_messages
      puts @test_category.errors.full_messages
    end

    it "validates if there is a name" do
      @test_category = Category.new(name: "TestCat")
      @test_category.save
      @test_product = Product.new(
        name: "TestProdName",
        price: 1000,
        quantity: 1,
        category: @test_category
      )
      @test_product.save
      puts @test_category.errors.full_messages
      puts @test_product.errors.full_messages
      expect(@test_product).to be_valid
    end
    it "validates if there is a price" do
      @test_category = Category.new(name: "TestCat")
      @test_category.save
      @test_product = Product.new(
        name: "TestProdName",
        price: 1000,
        quantity: 1,
        category: @test_category
      )
      @test_product.save
      puts @test_category.errors.full_messages
      puts @test_product.errors.full_messages
      expect(@test_product).to be_valid
    end
    it "validates if there is a quantity" do
      @test_category = Category.new(name: "TestCat")
      @test_category.save
      @test_product = Product.new(
        name: "TestProdName",
        price: 1000,
        quantity: 1,
        category: @test_category
      )
      @test_product.save
      puts @test_category.errors.full_messages
      puts @test_product.errors.full_messages
      expect(@test_product).to be_valid
    end
    it "validates if there is a category" do
      @test_category = Category.new(name: "TestCat")
      @test_category.save
      @test_product = Product.new(
        name: "TestProdName",
        price: 1000,
        quantity: 1,
        category: @test_category
      )
      @test_product.save
      puts @test_category.errors.full_messages
      puts @test_product.errors.full_messages
      expect(@test_product).to be_valid
    end

  end

end
