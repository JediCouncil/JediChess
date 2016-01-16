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
    factory :bishop, class: 'Bishop' do
    end

  end
end
