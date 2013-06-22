class ProposalCommentsController < ApplicationController
  def destroy
    proposal_comment = ProposalComment.find params[:id]
    if can? :destroy, proposal_comment
      proposal_comment.destroy
      redirect_to(proposal_path(proposal_comment.proposal))
    else
      head :unauthorized
    end
  end
  
  def create
    proposal = Proposal.find params[:proposal_id]
    comment = proposal.comments.create(user: current_user, body: params[:proposal_comments][:body])
    
    if comment.save
      redirect_to(proposal_path(proposal))
    else
      head :internal_server_error
    end

  end
end
