FactoryGirl.define do
  factory :piece do
    x ""
    y ""
    color ""
    outcome ""
    casualty ""
    type ""
    trait :black do
      status :black
    end

    trait :white do
      status :white
    end
  end
end
