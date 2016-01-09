FactoryGirl.define do
  factory :piece do
    factory :pawn, class: 'Pawn' do
    end
    factory :king, class: 'King' do
    end
    factory :rook, class: 'Rook' do
    end
  end
end
