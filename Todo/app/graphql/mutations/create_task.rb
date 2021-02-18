
module Mutations
  class CreateTask < Mutations::BaseMutation
    argument :title, String, required: true

    type Types::TaskType

    def resolve(title:)
      Task.create!(title: title)
    end
  end
end

