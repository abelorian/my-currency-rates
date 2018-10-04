class CreateProjectData < ActiveRecord::Migration[5.2]
  def change
    create_table :project_data do |t|
      t.string :key
      t.text :value

      t.timestamps
    end
  end
end
