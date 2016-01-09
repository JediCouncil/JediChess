FactoryGirl.define do
  factory :piece do
    factory :pawn, class: 'Pawn' do
    end
    factory :king, class: 'King' do
    end
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

    factory :knight, class: 'Knight' do
    end
  end
end
