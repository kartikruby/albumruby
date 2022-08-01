class CreateFolders < ActiveRecord::Migration[7.0]
  def change
    create_table :folders do |t|
      t.string :name
      t.text :description
      t.text :tag
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
