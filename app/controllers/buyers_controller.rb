class BuyersController < ApplicationController

    def index
        @buyers = Buyer.search(params[:room])
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
  params.require(:buyer).permit(:room)
end



end

