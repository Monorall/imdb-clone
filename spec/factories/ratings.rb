FactoryBot.define do
  factory :rating do
    stars { rand(1..5) }
    user
    movie
  end
end
