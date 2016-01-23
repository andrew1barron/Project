class CreateStaffPages < ActiveRecord::Migration
  def change
    create_table :staff_pages do |t|

      t.timestamps null: false
    end
  end
end
