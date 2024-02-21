class CreateProducts < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE TYPE product_status AS ENUM ('draft', 'published', 'archived');
    SQL

    create_table :products do |t|
      t.string :name
      t.column :status, :product_status, default: 'draft'
      t.timestamps
    end
  end

  def down
    drop_table :products
    execute <<-SQL
      DROP TYPE product_status;
    SQL
  end
end
