class AddUnited < ActiveRecord::Migration[5.1]
  def up
    United::UNIDADES.each do |u|
      United.create(u)
    end
  end

  def down
    United.delete_all
  end
end
