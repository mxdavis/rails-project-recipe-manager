class CreateRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_ingredients do |t|
      t.string :quantity, null: false
      t.belongs_to :recipe, null: false
      t.belongs_to :ingredient, null: false

      t.timestamps null: false
    end
  end
end
