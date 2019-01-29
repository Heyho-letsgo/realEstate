module SellerHelper
  def sort_link(column, title = nil, data=nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
    icon = column == sort_column ? icon : ""
    if data
      link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction, room: data}
    else
      link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction}
    end
  end
end
