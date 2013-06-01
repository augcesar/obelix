class CreateLogin < ActiveRecord::Migration
  def change
    create_table :login do |t|
      t.string :usuario
      t.string :senha
      t.integer :ativo

      t.timestamps
    end
  end
end
