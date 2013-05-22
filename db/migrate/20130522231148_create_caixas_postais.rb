class CreateCaixasPostais < ActiveRecord::Migration
  def change
    create_table :caixas_postais do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
