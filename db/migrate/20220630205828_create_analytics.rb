class CreateAnalytics < ActiveRecord::Migration[6.0]
  def change
    create_table :analytics do |t|
      t.integer :link_id
      t.string :ip
      t.string :state
      t.string :country
      t.string :city
      t.string :click_count

      t.timestamps
    end
  end
end
