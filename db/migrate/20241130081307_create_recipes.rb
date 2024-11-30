class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.text :ingredients_text
      t.text :step_text
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
