FactoryGirl.define do
  factory :piece do
    factory :pawn, class: "Pawn" do
    end
  end

  factory :king do
    x ''
    y ''
    color ''
    outcome ''
    casualty ''
    type ''
    trait :black do
      status :black
    end

    trait :white do
      status :white
    end
  end
end
