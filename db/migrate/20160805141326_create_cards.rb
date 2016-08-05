class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :effect
      t.string :img_url
      t.string :description
      t.integer :attack
      t.integer :defense
      t.integer :mana
      t.string :rarity
      t.references :deck, index: true, foreign_key: true
      t.timestamps
    end
  end
end
