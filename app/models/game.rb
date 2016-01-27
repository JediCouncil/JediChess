class Game < ActiveRecord::Base
  has_one :white_player, class_name: :user
  has_one :black_player, class_name: :user
  has_many :pieces

  after_create :populate_board!

  # scope :available, -> {
  # 	joins("LEFT OUTER JOIN users ON users.game_id = games.id").
  # 	group("games.id").
  # 	having("count(games.id) < 2")
  # }

  scope :available, -> { where('black_player_id IS NULL OR white_player_id IS NULL') }

  def check?
    #game is in check if either black or white king is in check
    king_is_in_check?('black') || king_is_in_check('white')
  end

  def king_is_in_check?(color)
    #finds king by color
    king = pieces.find_by(type: "King", color: color)
    #returns array of all opposing pieces
    opponents = pieces.includes(:game).where(color: !king.color).to_a
    #loops through each opposing piece to determine if they have a valid move
    #that can capture king
    opponents.each do |opponent|
      if opponent.valid_move?(king.x, king.y) == true
        return true
      end
    end
    false
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
