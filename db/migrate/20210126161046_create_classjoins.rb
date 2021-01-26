class CreateClassjoins < ActiveRecord::Migration[6.0]
  def change
    create_table :classjoins do |t|
      t.string :topic
      t.text :details
      t.datetime :time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
