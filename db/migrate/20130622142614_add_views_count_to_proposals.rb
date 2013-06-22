class AddViewsCountToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :views_count, :integer, default: 1
  end
end
