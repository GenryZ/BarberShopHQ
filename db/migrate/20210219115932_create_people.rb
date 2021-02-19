class CreatePeople < ActiveRecord::Migration[6.1]
  def change
  	create_table :people do |p|
  		p.text :name
  		p.text :phone
  		p.timestamps
  	end
  end
end
