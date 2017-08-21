class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :cmd
      t.references :client, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps
    end
  end
end
