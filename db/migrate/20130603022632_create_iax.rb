class CreateIax < ActiveRecord::Migration
  def change
    create_table :iax do |t|
      t.string :bindport
      t.string :bindaddr
      t.string :disallow
      t.string :bandwidth
      t.string :allow
      t.string :tos

      t.timestamps
    end
  end
end
