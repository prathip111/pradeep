class AddColumnToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :status_id, :integer
  end
end
