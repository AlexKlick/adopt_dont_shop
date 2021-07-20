class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(search_params)
    where("name ILIKE ?", "%#{search_params}%")
  end

  def self.sort_alphabetically(table, column, order)
    find_by_sql("Select * FROM #{table} ORDER BY LOWER(#{column}) #{order}")
  end
end
