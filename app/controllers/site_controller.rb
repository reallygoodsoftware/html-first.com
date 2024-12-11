class SiteController < ApplicationController

  # TODO: Remove this. Coding offline and can't remember one-liner to include the auth token in the form
  skip_before_action :verify_authenticity_token, :only => [:plain_remote_form, :remote_form]

  def rgs 
    use_bare_layout
    render layout: "rgs"
  end

  def show_docs_page 
    params[:file].present? ? @filename = "docs/#{params[:file]}.md" : @filename = "readme.md"
    @content = Utilities.markdown_to_html("#{@filename}")
  end

  def show_snippet
    @resource = Resource.find(params[:id])
    @content = @resource.get_hypergist_content
  end
  
end