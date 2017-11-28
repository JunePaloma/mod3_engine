class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'citext'
    create_table :merchants do |t|
      t.string :name

      t.timestamps
    end
  end
end
