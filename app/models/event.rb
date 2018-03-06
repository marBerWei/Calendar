

class Event < ApplicationRecord
	 validates :name, :uniqueness => true, :presence => true
	 validates :time_start, :uniqueness => true, :presence => true
	 validates :time_end, :uniqueness => true, :presence => true
end

