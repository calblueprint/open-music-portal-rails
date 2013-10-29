class PiecesController < ApplicationController
  before_action :admin_user,       only: :new
  def index
    @pieces = Piece.paginate(:page => params[:page])
  end

  def show
    @piece = Piece.find(params[:id])
    render json: @piece
  end

  def new
    @piece = Piece.new
  end

  def create
    composer = params[:composer][:name].empty? ? nil : Composer.where(:name => params[:composer][:name]).first_or_create
    nationality = params[:nationality][:name].empty? ? nil : Nationality.where(:name => params[:nationality][:name]).first_or_create
    book = params[:book][:name].empty? ? nil : Book.where(:name => params[:book][:name]).first_or_create
    publisher = params[:publisher][:name].empty? ? nil : Publisher.where(:name => params[:publisher][:name]).first_or_create
    period = params[:period][:name].empty? ? nil : Period.where(:name => params[:period][:name]).first_or_create
    level = params[:level][:name].empty? ? nil : Level.where(:name => params[:level][:name]).first_or_create
    @piece = Piece.new(
      composer: composer,
      nationality: nationality,
      title: params[:piece][:title],
      book: book,
      publisher: publisher,
      affiliate_link: params[:piece][:affiliate_link],
      length_minutes: params[:piece][:length_minutes],
      length_seconds: params[:piece][:length_seconds],
      period: period,
      pages: params[:piece][:pages],
      level: level,
      other_a: params[:piece][:other_a],
      other_b: params[:piece][:other_b],
      other_c: params[:piece][:other_c]
    )
    if @piece.save
      redirect_to piece_url(@piece)
    else
      render 'new'
    end
  end

  def typeahead_search
    key_to_class = {
      'composers' => Composer,
      'nationalities' => Nationality,
      'books' => Book,
      'publishers' => Publisher,
      'periods' => Period,
      'levels' => Level
    }
    key = params[:key]
    if key_to_class.has_key?(key)
      query = params[:q].downcase
      render json: key_to_class[key].where('lower(name) like ?', "%#{query}%").limit(100).pluck(:name)
    else
      logger.info "Typeahead endpoint received invalid key '#{key}'. Either there is a bug in frontend typeahead code or a user is being nosy"
      render json: []
    end
  end

  private
    def admin_user
      redirect_to(root_url) unless current_user.has_role? :admin
    end
end
