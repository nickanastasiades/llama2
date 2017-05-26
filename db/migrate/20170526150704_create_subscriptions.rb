class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.integer :client_id
      t.integer :plan_id
      t.date :end_date

      t.timestamps

    end
  end
end
