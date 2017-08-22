class AlterCommentComment < ActiveRecord::Migration[5.1]
  def change
	rename_column :contacts, :comment, :message
  end
end
