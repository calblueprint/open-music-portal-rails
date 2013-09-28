class PiecesController < ApplicationController
  def index
    @pieces = Piece.all
  end
end
