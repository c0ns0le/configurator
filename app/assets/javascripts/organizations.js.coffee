root = global ? window

angular.module("organizations", ["ngResource"]).factory "Organization", ['$resource', ($resource) ->
  Organization = $resource("/organizations/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  Organization::destroy = (cb) ->
    Organization.remove
      id: @id
    , cb

  Organization
]
root.angular = angular
