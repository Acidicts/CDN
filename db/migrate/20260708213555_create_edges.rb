class CreateEdges < ActiveRecord::Migration[8.1]
  def change
    # origin app
    create_table :edges do |t|
      t.string :name
      t.string :base_url        # e.g. https://edge1.example.com
      t.string :api_key_digest  # hashed token this edge uses to authenticate
      t.string :status, default: "pending" # pending/active/suspended
      t.datetime :last_seen_at
      t.json :capabilities, default: {}   # storage size, region, etc.
      t.timestamps
    end
  end
end
