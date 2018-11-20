class FixColumnName < ActiveRecord::Migration[5.2]
  def change

    rename_column :scams, :type, :scam_type

  end
end
