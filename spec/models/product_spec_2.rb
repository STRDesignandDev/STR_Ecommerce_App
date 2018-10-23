require 'rails_helper'


describe Product do

  let(:product) { Product.create!(price: "2000", birdtype: "bad", description: "horrible jerk bird, I spit at you bird", image_url: "6.jpg") }

  it "product must have a name to be valid" do
    expect(Product.new(description: "horrible jerk bird, I spit at you bird")).not_to be_valid
  end

end
