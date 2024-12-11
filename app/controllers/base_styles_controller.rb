class BaseStylesController < ApplicationController

  def show_doc
    @body_layout = "layout_a"
  end

  def examples
    params[:file] = "examples" # This is a kind of hacky way to get markdown menu active highlighting to work 
    if request_from_iframe?
      response.headers.except! 'X-Frame-Options'
    else
      # Request is likely not from an iframe
    end
  end
  
end