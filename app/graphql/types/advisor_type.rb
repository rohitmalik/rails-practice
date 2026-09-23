module Types
    class AdvisorType < Types::BaseObject
        field :id, ID, null: false
        field :name, String, null: false
        field :email, String, null: false
        field :phone, String, null: true
    end
    end