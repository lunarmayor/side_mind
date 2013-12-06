class Sharedlist < Basiclist
  has_many :list_assignments
  has_many :users, through: :list_assignments
  has_many :tasks, foreign_key: :list_id

end