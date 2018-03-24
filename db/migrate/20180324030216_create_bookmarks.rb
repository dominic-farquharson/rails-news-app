class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :link
      t.string :note
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
