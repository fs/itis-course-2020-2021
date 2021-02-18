
module Mutations
  class DestroyComment < Mutations::BaseMutation
    argument :id, ID, required: true

    type Types::CommentType

    def resolve(id:)
      Comment.find(id).destroy!
    end
  end
end

