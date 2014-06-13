root = global ? window

angular.module("service_default_values", ["ngResource"]).factory "ServiceDefaultValue", ['$resource', ($resource) ->
  ServiceDefaultValue = $resource("/service_default_values/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  ServiceDefaultValue::destroy = (cb) ->
    ServiceDefaultValue.remove
      id: @id
    , cb

  ServiceDefaultValue
]
root.angular = angular
