class SellersController < ApplicationController

   def index
       @sellers = Seller.all
      
   end
   
   def show
      @seller = Seller.find(params[:id])
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

   def search
      
   end

end
