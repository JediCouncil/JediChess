FactoryGirl.define do
  factory :piece do
    factory :pawn, class: 'Pawn' do
    end

    factory :rook, class: 'Rook' do
    end

    factory :king, class: 'King' do
    end

    factory :knight, class: 'Knight' do
    end

    factory :queen, class: 'Queen' do
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

  end

end
