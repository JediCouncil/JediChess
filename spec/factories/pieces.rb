FactoryGirl.define do
  factory :piece do
    association :game
    factory :pawn, class: 'Pawn' do
    end
  end
end
