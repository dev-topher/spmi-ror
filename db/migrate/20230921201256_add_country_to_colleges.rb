class AddCountryToColleges < ActiveRecord::Migration[7.0]
  def change
    add_reference :colleges, :country, foreign_key: true
  end
end
