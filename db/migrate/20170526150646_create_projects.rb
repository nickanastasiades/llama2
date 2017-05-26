class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :project_type
      t.string :description
      t.string :status
      t.float :version
      t.integer :client_id
      t.integer :designer_id
      t.float :hours

      t.timestamps

    end
  end
end
