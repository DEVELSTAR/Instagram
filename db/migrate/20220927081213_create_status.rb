class CreateStatus < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string :body
      t.integer :user_id

      t.timestamps
    end
  end
end
