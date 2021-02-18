
module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :tasks, [Types::TaskType], null: true
    field :task, Types::TaskType, null: true do
      argument :id, Integer, required: true
    end

    def tasks
      Task.all
    end

    def task(id:)
      Task.find(id)
    end
  end
end


