class CreateScams < ActiveRecord::Migration[5.2]
  def change
    create_table :scams do |t|
      t.string :type
      t.string :description
      t.datetime :submit_time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
