FactoryBot.define do

  factory :product do
    name{  "testbird" }
    image_url { "1.jpg" }
    birdtype  { "bad" }
    price { "100" }
    description { "just a test bird" }
  end
end
