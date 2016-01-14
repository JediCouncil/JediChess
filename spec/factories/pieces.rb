FactoryGirl.define do
  factory :piece do
    factory :pawn, class: 'Pawn' do
    end
    factory :king, class: 'King' do
    end
    factory :knight, class: 'Knight' do
    end
  end
end
