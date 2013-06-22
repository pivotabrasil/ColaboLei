class ProposalComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal
  attr_accessible :body, :user_id, :proposal_id
end
