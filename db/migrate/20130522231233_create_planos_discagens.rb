class CreatePlanosDiscagens < ActiveRecord::Migration
  def change
    create_table :planos_discagens do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
