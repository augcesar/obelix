class CreateSip < ActiveRecord::Migration
  def change
    create_table :sip do |t|
      t.string :context
      t.integer :bindport
      t.string :bindaddr
      t.string :tos_sip
      t.string :tos_audio
      t.string :tos_video
      t.string :videosupport
      t.string :t38pt_udptl
      t.string :limitonpeers

      t.timestamps
    end
  end
end
