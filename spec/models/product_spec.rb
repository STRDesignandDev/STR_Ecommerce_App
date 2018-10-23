require 'rails_helper'




describe Product do

  let(:product) { Product.create!(name: "horrible bird", price: "2000", birdtype: "bad", description: "horrible jerk bird, I spit at you bird", image_url: "6.jpg") }
  let(:user) { User.create!(first_name: "Bad", last_name: "Guy", email: "bad@guy.com", password: "badguy") }

before do
  product.comments.create!(rating: 1, user: user, body: "God I hate this bird. It doesn't even do any tricks.")
  product.comments.create!(rating: 3, user: user, body: "Ok bird I guess, I'd recommend but not with any enthusiasm. I mean, it is just a bird.")
  product.comments.create!(rating: 5, user: user, body: "This bird is my only true friend. I'd like to marry this bird.")
end

  it "returns the average rating of the comments combined" do
     expect(product.average_rating).to eq 3
  end

end
