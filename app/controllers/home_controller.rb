class HomeController < ApplicationController

  def index
    @proposals = Proposal.order(:likes_count).reverse_order.page(params[:page]).includes(:user)

    if user_signed_in?
      render :logged
    else
      render :unlogged
    end
  end

end
