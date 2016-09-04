# Example query string:
# {
#   "query" : "
#   {
#     user(id: 1) {
#       id created_wods {
#         edges { node { id title goal_type created_at } }
#       }
#     }
#   }"
# }

# Example mutation string:
# {
#   "query" : "mutation { CreateWod(input: { title: \"My Wod\", goal_type: \"amrap\" }) { wod { id title } } }"
# }
