WodItemType = GraphQL::ObjectType.define do
  name "WodItem"
  description "A part of WOD"
  field :reps, types.Int, "Number of repetitions"
end
