class BuyersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    search_room = params[:room]
    search_bedroom = params[:bedroom]
    column = params[:column]
    direction = params[:direction]
    @buyers = Buyer.search(search_room, search_bedroom).order("#{column} #{direction}").page(params[:page])
    #https://stackoverflow.com/questions/44504983/search-multiple-fields-with-multiple-values
    # https://rubyplus.com/articles/3381-Simple-Search-Form-in-Rails-5
    if @buyers.present?
      flash.discard[:success] = "List of buyers !"
    end
    if @buyers.blank?
      flash.discard[:error] = "No buyers for your request !"
    end
  end

  def show
    @buyer = Buyer.find(params[:id])
    # redirect_to @buyer
  end

  def new
    @buyer = Buyer.new
  end

  def create
    begin
      @buyer = Buyer.new(buyer_params)           
      @buyer.save!    #le point d'exclamation renvoie l'erreur au cas où - operation dangereuse avec un points d'exclamation
      flash[:success] = "Buyer created whith succes !"
      redirect_to "/buyers"
    rescue => quelque_probleme
      puts quelque_probleme.message 
      flash[:error] = "Buyer creation failed! #{quelque_probleme.message}"
      render 'new'
    end
  end

  def edit
    @buyer = Buyer.find(params[:id])
  end

  def update
    @buyer = Buyer.find(params[:id])
    if @buyer.update_attributes(buyer_params)

      flash[:success] = "Buyer updated whith succes !"
      redirect_to @buyer

    else
      flash[:error] = "Buyer NOT updated whith succes !"
      render 'edit'


    end

  end

  def delete

  end

  def from_sellers_to_buyers
    @buyers = Buyer.search(params[:seller_id].to_i,'')
    render :index
  end

  def sort_by
    @buyers = Buyer.all.order("#{sort_column} #{sort_direction}")
    render :sort_by
  end

  private

  def buyer_params
    params.permit(:room,:bedroom)
  end

  def sortable_columns
    ["room", "bedroom"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "room"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end

