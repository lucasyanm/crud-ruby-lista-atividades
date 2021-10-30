class MakeNameAndDateNotNullable < ActiveRecord::Migration[6.1]
  def change
    Activity.where(date: nil).update_all(date: Time.now)
    change_column :activities, :date, :datetime, null: false

    Activity.where(name: nil).update_all(name: "Sem nome")
    change_column :activities, :name, :string, null: false
  end
end
