class CreateCorrects < ActiveRecord::Migration[5.2]
  def change
    create_table :corrects do |t|
      t.text :body
      t.string :author
      t.boolean :moderate, default: false
      t.belongs_to :answer, foreign_key: true

      t.timestamps
    end
  end
end
