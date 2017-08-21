class AlterColumnFromComment < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments ,:cmd
    remove_column :comments ,:client_id
    remove_column :comments ,:image_id
    remove_column :comments ,:photo_id
    remove_column :comments ,:status_id
    add_column :comments ,:username ,:string
    add_column :comments ,:comments ,:string
    add_column :comments ,:status ,:integer, :default=>0
  end
end
