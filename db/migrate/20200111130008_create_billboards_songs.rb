class CreateBillboardsSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :billboards_songs do |t|
      t.belongs_to :billboard, index: true
      t.belongs_to :song, index: true
    end
  end
end
