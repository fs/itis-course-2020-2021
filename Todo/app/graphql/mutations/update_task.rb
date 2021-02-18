
module Mutations
  class UpdateTask < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: true

    type Types::TaskType

    def resolve(id:, title:)
      task = Task.find(id)

      task.update!(title: title)

      task
    end
  end
end

