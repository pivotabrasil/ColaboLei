class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  
  def render_not_found
    render file: "public/404.html", status: 404, layout: false      
  end

  def render_unauthorized_for_guests
    head :unauthorized unless user_signed_in?
  end  
end
