class AddForeignKeyToClips < ActiveRecord::Migration[5.0]

 add_reference :clips, :article, foreign_key: true
end
