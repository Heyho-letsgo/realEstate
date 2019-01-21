class BuyersController < ApplicationController
helper_method :sort_column, :sort_direction

    def index
        #@buyers = Buyer.all
        @buyers = Buyer.all
        search_room = params[:room]
        search_bedroom = params[:bedroom]
        
        @buyers = Buyer.search(search_room, search_bedroom).order(created_at: :desc)
        
        
        #https://stackoverflow.com/questions/44504983/search-multiple-fields-with-multiple-values
        # https://rubyplus.com/articles/3381-Simple-Search-Form-in-Rails-5
    
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

    def order
        
        Buyer.order(id: :desc)
        
    end

private

    def buyer_params
     params.permit(:room,:bedroom)
    end
end

