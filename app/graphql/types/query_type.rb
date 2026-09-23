# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :advisors, [Types::AdvisorType], null: false,
      description: "Fetches a list of all advisors."
    def advisors
      Advisor.all  # Fetch the first 2 advisors
    end

    field :advisor, Types::AdvisorType, null: true do 
      description "Fetches a single advisor by ID."
      argument :id, ID, required: true
    end
    def advisor(id:)
      Advisor.find_by(id: id)
    end
  end
end
