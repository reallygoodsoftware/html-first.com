class HtmlFirstController < ApplicationController

  def home
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
      @page_title = "Resources"
      @resources = Resource.all
    end
  end

end