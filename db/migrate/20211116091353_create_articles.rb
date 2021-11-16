class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.text :image_url
      t.boolean :published, default: false

      t.timestamps
    end
  end
end
