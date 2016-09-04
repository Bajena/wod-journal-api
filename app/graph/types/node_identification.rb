# GraphQL::Relay::GlobalNodeIdentification.instance_variable_set(:@instance, nil)

NodeIdentification = GraphQL::Relay::GlobalNodeIdentification.define do
  object_from_id -> (id) do
    type_name, id = NodeIdentification.from_global_id(id)
    # "Wod" -> Wod.find(id)
    type_name.constantize.find(id)
  end

  type_from_object -> (object) { GraphSchema.types[object.class.name] }
end
