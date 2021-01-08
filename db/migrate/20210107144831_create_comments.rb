class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :post, null: false, type: :uuid
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
