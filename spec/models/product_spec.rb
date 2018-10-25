require 'rails_helper'

describe Product do

  before do
   @user = FactoryBot.create(:user)
   @admin = FactoryBot.create(:admin)
   @product = FactoryBot.create(:product)
  end

  before do
    @product.comments.create!(rating: 1, user: @user, body: "God I hate this bird. It doesn't even do any tricks.")
    @product.comments.create!(rating: 3, user: @user, body: "Ok bird I guess, I'd recommend but not with any enthusiasm. I mean, it is just a bird.")
    @product.comments.create!(rating: 5, user: @user, body: "This bird is my only true friend. I'd like to marry this bird.")
  end

  it "returns the average rating of the comments combined" do
     expect(@product.average_rating).to eq 3
  end

  it "product must have a name to be valid" do
    expect(Product.new(description: "horrible jerk bird, I spit at you bird")).not_to be_valid
  end

end
