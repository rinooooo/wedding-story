class CreateCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :communities do |t|
      t.string     :community_name,             null: false
      t.references :wedding, foreign_key: true, null: false
      t.timestamps
    end
  end
end
