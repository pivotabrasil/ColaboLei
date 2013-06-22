class HomeController < ApplicationController

  def index
    @proposals = Proposal.order(:updated_at).page(params[:page])

    if user_signed_in?
      render :logged
    else
      render :unlogged
    end
  end

end
