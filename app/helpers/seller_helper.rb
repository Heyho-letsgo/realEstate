module SellerHelper
  def sort_link(column, data=nil)
    direction = sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon      = sort_direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
    #icon = column == sort_column ? icon : ""
    link_to "#{column.titleize}<span class='#{icon}'></span>".html_safe, {column: column, direction: direction}
  end
end
    #link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction}
    #title ||= column.titleize
