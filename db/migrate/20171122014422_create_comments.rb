class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :article_id

      t.timestamps null: false
    end
  end
end
