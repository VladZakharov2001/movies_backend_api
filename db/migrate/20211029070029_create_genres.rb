class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.integer :external_genre_id
      t.timestamps
    end 
  end
end
