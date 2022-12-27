class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.references :url, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
