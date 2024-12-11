class ApplicationController < ActionController::Base

  include ApplicationHelper
  
  def support_partial_response
    if request.headers['HX-Request']
      @async_request = true
      render :layout => false
    else  
      render 
    end
  end

  def use_bare_layout
    @use_bare_layout = true
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
    @use_bare_layout = true
  end

  
end