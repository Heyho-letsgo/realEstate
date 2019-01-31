class SellersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    search_room = params[:room]
    search_bedroom = params[:bedroom]
    column = params[:column]
    direction = params[:direction]
    @sellers = Seller.search(search_room, search_bedroom).order("#{column} #{direction}").page params[:page]
  end

  def show
    @seller = Seller.find(params[:id])
  end

  def new
    @seller = Seller.new
  end

  def create
    begin
      @seller = Seller.new(seller_params)           
      @seller.save!    #le point d'exclamation renvoie l'erreur au cas où - operation dangereuse avec un points d'exclamation
      flash[:success] = "Seller created whith succes !"
      redirect_to "/sellers"
    rescue => quelque_probleme
      puts quelque_probleme.message 
      flash[:error] = "Seller creation failed! #{quelque_probleme.message}"
      render 'new'
    end
  end

  def edit
    @seller = Seller.find(params[:id])
  end

  def update
    @seller = Seller.find(params[:id])
    if @seller.update_attributes(seller_params)
      flash[:success] = "Seller updated whith succes !"
      redirect_to @seller
    else
      flash[:error] = "Seller NOT updated whith succes !"
      render 'edit'
    end
  end

  def delete
  end

  def search_sellers
    render :search
  end

  def search_results
    search_room = params[:room]
    search_bedroom = params[:bedroom]
    column = params.fetch(:column, "room")
    direction = params.fetch(:direction, "asc")
    @sellers = Seller.search(search_room, search_bedroom).order("#{column} #{direction}").page params[:page]
    @room = search_room
    @bedroom = search_bedroom
    render :search_results
  end

  def from_buyers_to_sellers
    @sellers = Seller.search(params[:buyer_id].to_i,'').page params[:page]
    render :search_results
  end

  private

  def seller_params
    params.permit(:room,:bedroom)
  end

  def sortable_columns
    ["id","room", "bedroom"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "room"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
