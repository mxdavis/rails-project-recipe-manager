class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :recipe, null: false
      t.belongs_to :user, null: false
      t.integer :rating, null: false
      t.string :description

      t.timestamps null: false
    end
  end
end
