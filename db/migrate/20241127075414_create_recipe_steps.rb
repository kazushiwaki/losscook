class CreateRecipeSteps < ActiveRecord::Migration[8.0]
  def change
    create_table :recipe_steps do |t|
      t.integer :step_number
      t.string :instruction
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
