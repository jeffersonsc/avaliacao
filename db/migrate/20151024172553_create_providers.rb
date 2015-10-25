class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name , index: true

      t.timestamps null: false
    end
  end
end