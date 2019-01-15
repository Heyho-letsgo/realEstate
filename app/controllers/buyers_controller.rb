class BuyersController < ApplicationController

    def index
           @buyers = Buyer.all
    end      
       

   def show
       @buyer = Buyer.find(params[:id])
       @room = @buyer.room
       
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



end

