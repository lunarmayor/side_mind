class List < Basiclist
  has_many :tasks, foreign_key: :list_id
end