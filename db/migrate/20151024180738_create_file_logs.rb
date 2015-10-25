class CreateFileLogs < ActiveRecord::Migration
  def change
    create_table :file_logs do |t|
      t.string :original_filename
      t.string :name
      t.string :content_type
      t.boolean :processed, :boolean, default: false

      t.timestamps null: false
    end
  end
end
