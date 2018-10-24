require 'rails_helper'

describe Comment do

  let(:product) { Product.create!(name: "horrible bird", price: "2000", birdtype: "bad", description: "horrible jerk bird, I spit at you bird", image_url: "6.jpg") }
  let(:user) { User.create!(first_name: "Bad", last_name: "Guy", email: "bad@guy.com", password: "badguy") }

  before do
    product.comments.create!(rating: 1, user: user, body: "God I hate this bird. It doesn't even do any tricks.")
    product.comments.create!(rating: 5, user: user, body: "dope bird.")
  end

  it "comment must have a rating to be valid" do
    expect(Comment.new(body: "God I hate this bird. It doesn't even do any tricks.", user: user)).not_to be_valid
  end

  it "comment must have a user logged in to be valid" do
    expect(Comment.new(body: "dope bird.", rating: 5)).not_to be_valid
  end

end
