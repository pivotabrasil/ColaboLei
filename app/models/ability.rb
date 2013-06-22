class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, [Proposal, ProposalComment], user_id: user.id
  end

end
