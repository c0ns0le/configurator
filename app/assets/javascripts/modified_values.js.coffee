root = global ? window

angular.module("modified_values", ["ngResource"]).factory "ModifiedValue", ['$resource', ($resource) ->
  ModifiedValue = $resource("/modified_values/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  ModifiedValue::destroy = (cb) ->
    ModifiedValue.remove
      id: @id
    , cb

  ModifiedValue
]
root.angular = angular
