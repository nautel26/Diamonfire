class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.string :reviewer_name

      t.timestamps null: false
    end
  end
end
