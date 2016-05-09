class CreatePageviews < ActiveRecord::Migration
  def change
    create_table :pageviews do |t|
      t.text :controller_name
      t.text :action_name
      t.jsonb :data, default: {}
      t.text :session_id

      t.timestamps null: false
    end
  end
end
