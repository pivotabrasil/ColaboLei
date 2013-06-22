class AddSlugToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :slug, :string
  end
end
