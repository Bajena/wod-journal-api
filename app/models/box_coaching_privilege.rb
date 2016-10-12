class BoxCoachingPrivilege < ApplicationRecord
  belongs_to :user
  belongs_to :box
end
