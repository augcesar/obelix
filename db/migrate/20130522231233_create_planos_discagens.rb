class CreatePlanosDiscagens < ActiveRecord::Migration
  def change
    create_table :planos_discagens do |t|
      t.string :descricao,:limit => 5000

      t.timestamps
    end
  end
end
