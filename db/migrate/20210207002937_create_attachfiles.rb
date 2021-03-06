class CreateAttachfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :attachfiles do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.references :assignment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
