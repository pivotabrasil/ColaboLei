class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.text :body
      t.references :user
      t.string :title

      t.timestamps
    end
    add_index :proposals, :user_id
  end
end
