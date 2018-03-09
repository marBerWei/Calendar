

class Event < ApplicationRecord
	self.columns_hash['available_at'] = OpenStruct.new(type: :datetime, class: DateTime)
	 validates :name, :uniqueness => true, :presence => true
	 validates :time_start, :uniqueness => true, :presence => true
	 validates :time_end, :uniqueness => true, :presence => true
end

