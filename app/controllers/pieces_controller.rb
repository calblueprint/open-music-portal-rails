class PiecesController < ApplicationController
  def index
    @pieces = Piece.paginate(:page => params[:page])
  end
end
