module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil)
  end

  def sort_column
    Blog.column_names.include?(params[:sort]) ? params[:sort] : "blogs.name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
