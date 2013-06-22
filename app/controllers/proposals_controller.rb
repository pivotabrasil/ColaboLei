class ProposalsController < ApplicationController
  before_filter :render_unauthorized_for_guests, except: :show
  
  def new
    @proposal = Proposal.new
  end
  
  def create
    @proposal = current_user.proposals.build params[:proposal]
    if @proposal.save
      redirect_to(proposals_path(@proposal))
    else
      render :new
    end
  end
  
  def fork
    forked_proposal = Proposal.find params[:id]
    @proposal = current_user.proposals.build(body: forked_proposal.body, title: forked_proposal.title, forked_from: forked_proposal)

    render :new
  end

  def like
    proposal = Proposal.find params[:id]
    proposal.increment!(:likes_count)
    
    redirect_to :back
  end
  
  def destroy
    proposal = Proposal.find params[:id]
    if can? :destroy, proposal
      proposal.destroy
      redirect_to root_path
    else
      head :unauthorized
    end
  end

  def show
    @proposal = Proposal.find params[:slug]
    @proposal.increment!(:views_count)
  end
end
