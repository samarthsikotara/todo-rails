class AddedprojectsSchema < ActiveRecord::Migration[5.0]
  def change
  	create_table :projects do |t|
      t.uuid :uuid, default: "uuid_generate_v4()"
      t.string :name
      t.text :description
      t.boolean :completed, default: false
 			t.datetime :completed_on
 			
      t.timestamps
    end

    create_table :tasks do |t|
      t.uuid :uuid, default: "uuid_generate_v4()"
      t.string :name
      t.text :description
 			t.integer :project_id
 			t.boolean :completed, default: false
 			t.datetime :completed_on

      t.timestamps
    end

  end
end
