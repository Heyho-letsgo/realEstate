module SellerHelper
  def sort_link(column, data={})
    direction = sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon      = sort_direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
    link_to "#{column.titleize}<span class='#{icon}'></span>".html_safe, {column: column, direction: direction}.merge(data)
  end
end
