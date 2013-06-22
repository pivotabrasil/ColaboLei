class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :proposal
      t.text :body

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :proposal_id
  end
end
