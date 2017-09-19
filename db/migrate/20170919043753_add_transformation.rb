class AddTransformation < ActiveRecord::Migration[5.1]
  def up
    Transformation::TRANSFORMACION.each do |t|
      Transformation.create(t)
    end
  end

  def down
    Transformation.delete_all
  end
end
