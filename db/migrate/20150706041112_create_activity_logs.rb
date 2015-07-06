class CreateActivityLogs < ActiveRecord::Migration
  def change
    create_table :activity_logs do |t|
      t.references :user, index: true
      t.string :action
      t.string :detail
      t.string :resource_id

      t.timestamps null: false
    end
    add_foreign_key :activity_logs, :users
  end
end
