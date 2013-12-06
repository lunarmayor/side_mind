class TaskSerializer < ActiveModel::Serializer
  attributes :id, :content, :done
end
