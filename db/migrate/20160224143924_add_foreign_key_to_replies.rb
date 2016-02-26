class AddForeignKeyToReplies < ActiveRecord::Migration
  def change
  	add_foreign_key :replies, :users
  end
end
