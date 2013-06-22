class ProposalsController < ApplicationController
  before_filter :render_unauthorized_for_guests, except: :show
  
  def new
    @proposal = Proposal.new
  end
  
  def create
    @proposal = current_user.proposals.build params[:proposal]
    if @proposal.save
      redirect_to(proposal_path(slug: @proposal.slug, id: @proposal.id))
    else
      render :new
    end
  end
  
  def fork
    forked_proposta = Proposal.find params[:id]
  end
  
  def destroy; end
  def show; end
end
