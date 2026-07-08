class CreateServers < ActiveRecord::Migration[8.1]
  def change
    create_table :servers do |t|
      t.integer :region
      t.string :domain
      t.boolean :self

      t.timestamps
    end
  end
end
