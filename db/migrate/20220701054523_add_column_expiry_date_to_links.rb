class AddColumnExpiryDateToLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :expire_date, :datetime 
  end
end
