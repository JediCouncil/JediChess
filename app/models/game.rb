class Game < ActiveRecord::Base
  has_one :white_player, class_name: :user
  has_one :black_player, class_name: :user
  belongs_to :active_player, class_name: :user
  has_many :pieces

  after_create :populate_board!

  scope :available, -> { where('black_player_id IS NULL OR white_player_id IS NULL') }

  def change_turn!
    color = pieces.find_by(color: color)
    # used at end of move_to! method in piece.rb
    # if current player who played move_to! just now was white_player_id (white pieces)
    # then update the turn to the black_player_id (black pieces)
    if color == 'white'
      update_attributes(active_player_id: black_player_id)
    else
      update_attributes(active_player_id: white_player_id)
    end
  end

  private

  def populate_board!
    pieces.create(x: 'A', y: '1', type: 'Rook', color: 'white')
    pieces.create(x: 'B', y: '1', type: 'Knight', color: 'white')
    pieces.create(x: 'C', y: '1', type: 'Bishop', color: 'white')
    pieces.create(x: 'D', y: '1', type: 'Queen', color: 'white')
    pieces.create(x: 'E', y: '1', type: 'King', color: 'white')
    pieces.create(x: 'F', y: '1', type: 'Bishop', color: 'white')
    pieces.create(x: 'G', y: '1', type: 'Knight', color: 'white')
    pieces.create(x: 'H', y: '1', type: 'Rook', color: 'white')
    pieces.create(x: 'A', y: '2', type: 'Pawn', color: 'white')
    pieces.create(x: 'B', y: '2', type: 'Pawn', color: 'white')
    pieces.create(x: 'C', y: '2', type: 'Pawn', color: 'white')
    pieces.create(x: 'D', y: '2', type: 'Pawn', color: 'white')
    pieces.create(x: 'E', y: '2', type: 'Pawn', color: 'white')
    pieces.create(x: 'F', y: '2', type: 'Pawn', color: 'white')
    pieces.create(x: 'G', y: '2', type: 'Pawn', color: 'white')
    pieces.create(x: 'H', y: '2', type: 'Pawn', color: 'white')

    pieces.create(x: 'A', y: '8', type: 'Rook', color: 'black')
    pieces.create(x: 'B', y: '8', type: 'Knight', color: 'black')
    pieces.create(x: 'C', y: '8', type: 'Bishop', color: 'black')
    pieces.create(x: 'D', y: '8', type: 'Queen', color: 'black')
    pieces.create(x: 'E', y: '8', type: 'King', color: 'black')
    pieces.create(x: 'F', y: '8', type: 'Bishop', color: 'black')
    pieces.create(x: 'G', y: '8', type: 'Knight', color: 'black')
    pieces.create(x: 'H', y: '8', type: 'Rook', color: 'black')
    pieces.create(x: 'A', y: '7', type: 'Pawn', color: 'black')
    pieces.create(x: 'B', y: '7', type: 'Pawn', color: 'black')
    pieces.create(x: 'C', y: '7', type: 'Pawn', color: 'black')
    pieces.create(x: 'D', y: '7', type: 'Pawn', color: 'black')
    pieces.create(x: 'E', y: '7', type: 'Pawn', color: 'black')
    pieces.create(x: 'F', y: '7', type: 'Pawn', color: 'black')
    pieces.create(x: 'G', y: '7', type: 'Pawn', color: 'black')
    pieces.create(x: 'H', y: '7', type: 'Pawn', color: 'black')
  end
end
