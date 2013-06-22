class AddCategoryAndLikesCountToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :category, :string, default: "Sem Categoria"
    add_column :proposals, :likes_count, :integer, default: 1
  end
end
