class ListAssignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :sharedlist
end
