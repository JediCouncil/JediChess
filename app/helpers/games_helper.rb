module GamesHelper
  def render_pieces(game) # this function takes a game object as input and spit out a hash with "xy" ('a8') as key and "color_type" ("black_rook") as value
    render_hash = {}
    game.pieces.each do |piece|
      pos_id = piece.x + piece.y.to_s
      piece_class = piece.color + '_' + piece.type.downcase # gon.piece_class = white_knight
      render_hash [pos_id] = piece_class
    end
    render_hash
  end
end
