class CreateRamais < ActiveRecord::Migration
  def change
    create_table :ramais do |t|
      t.string :callerid
      t.string :type
      t.string :username
      t.string :secret
      t.string :canreinvite
      t.string :host
      t.string :context
      t.string :dtmfmode
      t.string :call_limit
      t.string :nat

      t.timestamps
    end
  end
end
