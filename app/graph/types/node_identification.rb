NodeIdentification = GraphQL::Relay::GlobalNodeIdentification.define do
  object_from_id lambda { |id|
    type_name, id = NodeIdentification.from_global_id(id)
    type_name.constantize.find(id)
  }

  type_from_object -> (object) { GraphSchema.types[object.class.name] }
end
