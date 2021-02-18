module Types
  class MutationType < Types::BaseObject
    field :create_task, mutation: Mutations::CreateTask
    field :update_task, mutation: Mutations::UpdateTask
    field :destroy_task, mutation: Mutations::DestroyTask

    field :create_comment, mutation: Mutations::CreateComment
    field :update_comment, mutation: Mutations::UpdateComment
    field :destroy_comment, mutation: Mutations::DestroyComment
  end
end

