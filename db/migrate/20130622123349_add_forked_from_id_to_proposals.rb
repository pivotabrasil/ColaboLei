class AddForkedFromIdToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :forked_from_id, :integer
  end
end
