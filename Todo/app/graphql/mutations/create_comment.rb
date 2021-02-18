
module Mutations
  class CreateComment < Mutations::BaseMutation
    argument :content, String, required: true
    argument :task_id, ID, required: true

    type Types::CommentType

    def resolve(content:, task_id:)
      Comment.create!(content: content, task_id: task_id)
    end
  end
end

