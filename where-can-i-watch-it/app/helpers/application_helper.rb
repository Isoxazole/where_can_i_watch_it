module ApplicationHelper
  def hilite(field)
    "hilite" unless params[:sort] != field #Hilight the Table Header that is being sorted
  end
end
