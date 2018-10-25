require 'rails_helper'

describe Comment do

  it "comment must have a rating to be valid" do
    expect(Comment.new(body: "God I hate this bird. It doesn't even do any tricks.", user: @user)).not_to be_valid
  end

  it "comment must have a user logged in to be valid" do
    expect(Comment.new(body: "dope bird.", rating: 5)).not_to be_valid
  end

end
