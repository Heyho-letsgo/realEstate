class ProductsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @products = Product.order("#{sort_column} #{sort_direction}")
  end
private
  def sortable_columns
    ["name", "price"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
