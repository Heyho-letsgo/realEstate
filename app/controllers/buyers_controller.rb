class BuyersController < ApplicationController

    def index
        @buyers = Buyer.all
        search_room = params[:room]
        search_bedroom = params[:bedroom]
        
        @buyers = Buyer.search(search_room, search_bedroom)
        
        
        #https://stackoverflow.com/questions/44504983/search-multiple-fields-with-multiple-values
        #Buyer.search(params[:room])
    end      
       

   def show
       @buyer = Buyer.find(params[:id])
       
       
   end
   
   def new
   end
   
   def create
   end
   
   def edit
   end
   
   def update
   end
   
   def delete
   end



def buyer_params
  params.require(:buyer).permit(:room, :bedroom)
end



end

