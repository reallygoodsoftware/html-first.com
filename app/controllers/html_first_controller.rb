class HtmlFirstController < ApplicationController

  def home
    @page_title = "About HTML First"
    @body_layout = "layout_a"
  end

  def guidelines 
    @page_title = "HTML First"
    @body_layout = "layout_a"
  end

  def resources
    @body_layout = "layout_a"
    if params[:kind]
      @kind = ResourceKind.find_by(identifier:params[:kind])
      if @kind 
        @page_title = @kind.name.pluralize
        @resources = Resource
          .joins(:resource_kinds)
          .where("resource_kinds.identifier = ?", params[:kind])
      end
    else 
      @page_title = "Directory"
      @resources = Resource.all
    end
  end

end