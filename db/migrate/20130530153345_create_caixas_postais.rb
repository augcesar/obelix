class CreateCaixasPostais < ActiveRecord::Migration
  def change
    create_table :caixas_postais do |t|
      t.references :ramal
      t.string :descricao,:limit => 5000

      t.timestamps
    end
    add_index :caixas_postais, :ramal_id
  end
end
