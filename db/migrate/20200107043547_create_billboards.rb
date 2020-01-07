class CreateBillboards < ActiveRecord::Migration[6.0]
  def change
    create_table :billboards do |t|
      t.string :title
      t.string :country

      t.timestamps
    end
  end
end
