class PiecesController < ApplicationController
  include GamesHelper

  def show
    @piece = current_piece
    @game = @piece.game
    @pieces_hash = render_pieces(@game)
    @piece_pos_id = @piece.x + @piece.y.to_s
  end

  def update
    # call valid move functions and return valid or invalid

    # Wrap the following inside an if valid statement
    #case 1: only dest_cell -->move_to! returned true
    #case 2: only org_cell -->move_to! returned false
    #res[0] will contain a location flag: 0->org cell update; 1->des cell update
    #res[1] will be the hash with the piece id, type, color 
    @flag = 0

    current_piece.move_to!(current_piece.id, params[:dest_x], params[:dest_y]) ? @flag=1 : @flag=0
    # binding.pry
    @current_game = @current_piece.game

    if @flag==1
      @dest_piece = @current_game.pieces.where(x: params[:dest_x], y: params[:dest_y])[0]
      @org_piece = @current_game.pieces.where(x: params[:org_x], y: params[:org_y])[0]
      @piece_hash = ["dest_piece_id"=>@dest_piece.id, "dest_piece_color"=>@dest_piece.color, "dest_piece_type"=>@dest_piece.type.downcase!, "org_piece_id"=>@org_piece.id, "org_piece_color"=>@org_piece.color, "org_piece_type"=>@org_piece.type.downcase!]
    elsif @flag==0
      binding.pry
      @org_piece = @current_game.pieces.where(x: params[:org_x], y: params[:org_y])[0]
      @piece_hash = ["piece_id"=>@org_piece.id, "piece_color"=>@org_piece.color, "piece_type"=>@org_piece.type.downcase!]
    end

    @piece_array = [@flag, @piece_hash]

    render json: @piece_array
    # render :nothing => true, status => 200
   
  end

  private

  helper_method :curent_piece

  def current_piece
    @current_piece ||= Piece.find(params[:id])
  end

  def piece_params
    params.permit(:id, :x, :y)
  end
end
