class BuyersController < ApplicationController

    def index
        @buyers = Buyer.all
        search_room = params[:room]
        search_bedroom = params[:bedroom]
        
        @buyers = Buyer.search(search_room, search_bedroom)
        
        
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
        if @buyer = Buyer.new(buyer_params)
           @buyer.save
           redirect_to "/buyers"
        else
            render 'create'
        end
    end
   
    def edit
        @buyer = Buyer.find(params[:id])
        
    end
   
    def update
        @buyer = Buyer.find(params[:id])
        if @buyer.update_attributes(buyer_params)
            
            redirect_to @buyer
            flash[:success] = "Buyer updated whith succes !"
        else
            render 'edit'
        end
        
    end
   
    def delete
    end



private
    def buyer_params
     params.permit(
    :room,
    :bedroom
  )
    end
    

end

