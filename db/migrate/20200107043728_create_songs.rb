class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.datetime :released_on
      t.string :genre
      t.float :rating
      t.integer :artist_id

      t.timestamps
    end
    add_index :songs, :artist_id
  end
end
