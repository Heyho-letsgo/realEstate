class SellersController < ApplicationController

   def index
       @sellers = Seller.all
        search_room = params[:room]
        search_bedroom = params[:bedroom]
        
        @sellers = Seller.search(search_room, search_bedroom).order(created_at: :desc)
      
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
    @sellersResults = Seller.all    
    @sellersResults = Seller.search(search_room, search_bedroom).order(created_at: :desc)
    render :results_index
   end
   
    def from_buyers_to_sellers
        @sellers = Seller.search(params[:buyer_id].to_i,'')
        render :index
    end
        
        
    
   
   
   private

    def seller_params
     params.permit(:room,:bedroom)
    end

end
