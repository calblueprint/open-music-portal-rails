class SetPieceTimes < ActiveRecord::Migration
  def change
    Piece.all.each do |piece|
      if not piece.length_minutes and not piece.length_seconds
        piece.length_minutes = 3
        piece.length_seconds = 0
        piece.save!
      end
    end
  end
end
