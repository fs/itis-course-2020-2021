
module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :comments, [Types::CommentType], null: true
  end
end


