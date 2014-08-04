class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :rating
      t.references :cat, index: true

      t.timestamps
    end
  end
end
