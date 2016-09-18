class Movement < ActiveRecord::Base
  validates :name, uniqueness: true
end
