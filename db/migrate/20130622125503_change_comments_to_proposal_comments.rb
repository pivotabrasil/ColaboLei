class ChangeCommentsToProposalComments < ActiveRecord::Migration
  def up
    rename_table "comments", "proposal_comments"
  end

  def down
    rename_table "proposal_comments", "comments"
  end
end
