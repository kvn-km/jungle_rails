require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
    it "saves a new user" do
      @test_user = User.new(
        email: "test@email.com",
        password: "testPass",
        password_confirmation: "testPass",
        first_name: "FirstTest",
        last_name: "LastTest"
      )
      @test_user.save
      # puts @test_user.errors.full_messages
    end
    it "validates if new user has first name" do
      @test_user = User.new(
        email: "test@email.com",
        password: "testPass",
        password_confirmation: "testPass",
        first_name: "FirstTest",
        last_name: "LastTest"
      )
      @test_user.save
      # puts @test_user.errors.full_messages
      expect(@test_user).to be_valid
    end
    it "validates if new user has last name" do
      @test_user = User.new(
        email: "test@email.com",
        password: "testPass",
        password_confirmation: "testPass",
        first_name: "FirstTest",
        last_name: "LastTest"
      )
      @test_user.save
      # puts @test_user.errors.full_messages
      expect(@test_user).to be_valid
    end
    it "fails if new user does not have unique email" do
      @test_user1 = User.new(
        email: "TEST@EMAIL.com",
        password: "testPass1",
        password_confirmation: "testPass1",
        first_name: "FirstTest1",
        last_name: "LastTest1"
      )
      @test_user1.email.downcase!
      @test_user = User.new(
        email: "test@email.COM",
        password: "testPass",
        password_confirmation: "testPass",
        first_name: "FirstTest",
        last_name: "LastTest"
      )
      @test_user.email.downcase!
      @test_user1.save
      @test_user.save
      puts @test_user1.errors.full_messages
      # puts @test_user.errors.full_messages
      expect(@test_user).not_to be_valid
    end
    it "validates if new user has password with min length" do
      @test_user = User.new(
        email: "test@email.COM",
        password: "TestPass",
        password_confirmation: nil,
        first_name: "FirstTest",
        last_name: "LastTest"
      )
      @test_user.email.downcase!
      @test_user.save
      # puts @test_user.errors.full_messages
      expect(@test_user).to be_valid
    end
    it "validates if new user's confirmation password matches password" do
      @test_user = User.new(
        email: "test@email.COM",
        password: "TestPass",
        password_confirmation: "TestPass",
        first_name: "FirstTest",
        last_name: "LastTest"
      )
      @test_user.email.downcase!
      @test_user.save
      # puts @test_user.errors.full_messages
      expect(@test_user).to be_valid
    end
    it "fails if new user's confirmation password does not match password" do
      @test_user = User.new(
        email: "test@email.COM",
        password: "TestPass",
        password_confirmation: "Wrong",
        first_name: "FirstTest",
        last_name: "LastTest"
      )
      @test_user.email.downcase!
      @test_user.save
      # puts @test_user.errors.full_messages
      expect(@test_user).not_to be_valid
    end
  end

  describe ".authenticate_with_credentials" do
  
    it "verifies the correct credentials" do
      @test_user = User.new(
        email: "test@email.com",
        password: "TestPass",
        password_confirmation: "TestPass",
        first_name: "FirstTest",
        last_name: "LastTest"
      )
      @test_user.save
      testuser = User.authenticate_with_credentials("test@email.com", "TestPass")
      expect(testuser.first_name).to eql("FirstTest")
    end
    it "returns nil if incorrect credentials" do
      @test_user = User.new(
        email: "test@email.com",
        password: "TestPass",
        password_confirmation: "TestPass",
        first_name: "FirstTest",
        last_name: "LastTest"
      )
      @test_user.save
      testuser = User.authenticate_with_credentials("test@email.com", "WrongPass")
      expect(testuser).to eql(nil)
    end
  end

  describe "trim whitespace" do
    it "removes leading and trailing spaces from inputs" do
      @test_user = User.new(
        email: "   TEST@EMAIL.COM  ",
        password: "TestPass ",
        password_confirmation: " TestPass",
        first_name: " FirstTest  ",
        last_name: " LastTest "
      )
      @test_user.save
      expect(@test_user.email).to eql("test@email.com")
      expect(@test_user.password).to eql("TestPass")
      expect(@test_user.first_name).to eql("FirstTest")
    end


  end

end
