root = global ? window

angular.module("services", ["ngResource"]).factory "Service", ['$resource', ($resource) ->
  Service = $resource("/services/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  Service::destroy = (cb) ->
    Service.remove
      id: @id
    , cb

  Service
]
root.angular = angular
