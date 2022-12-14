class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.text :description
      t.text :tag
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
