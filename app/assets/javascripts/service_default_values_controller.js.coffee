
root = global ? window

ServiceDefaultValuesIndexCtrl = ($scope, ServiceDefaultValue) ->
  $scope.service_default_values = ServiceDefaultValue.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @service_default_value
      @service_default_value.destroy ->
        $scope.service_default_values = _.without($scope.service_default_values, original)
        
ServiceDefaultValuesIndexCtrl.$inject = ['$scope', 'ServiceDefaultValue'];

ServiceDefaultValuesCreateCtrl = ($scope, $location, ServiceDefaultValue) ->
  $scope.save = ->
    ServiceDefaultValue.save $scope.service_default_value, (service_default_value) ->
      $location.path "/service_default_values/#{service_default_value.id}/edit"

ServiceDefaultValuesCreateCtrl.$inject = ['$scope', '$location', 'ServiceDefaultValue'];

ServiceDefaultValuesShowCtrl = ($scope, $location, $routeParams, ServiceDefaultValue) ->
  ServiceDefaultValue.get
    id: $routeParams.id
  , (service_default_value) ->
    @original = service_default_value
    $scope.service_default_value = new ServiceDefaultValue(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.service_default_value.destroy ->
        $location.path "/service_default_values"

ServiceDefaultValuesShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'ServiceDefaultValue'];

ServiceDefaultValuesEditCtrl = ($scope, $location, $routeParams, ServiceDefaultValue) ->
  ServiceDefaultValue.get
    id: $routeParams.id
  , (service_default_value) ->
    @original = service_default_value
    $scope.service_default_value = new ServiceDefaultValue(@original)

  $scope.isClean = ->
    console.log "[ServiceDefaultValuesEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.service_default_value

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.service_default_value.destroy ->
        $location.path "/service_default_values"

  $scope.save = ->
    ServiceDefaultValue.update $scope.service_default_value, (service_default_value) ->
      $location.path "/service_default_values"

ServiceDefaultValuesEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'ServiceDefaultValue'];

# exports
root.ServiceDefaultValuesIndexCtrl  = ServiceDefaultValuesIndexCtrl
root.ServiceDefaultValuesCreateCtrl = ServiceDefaultValuesCreateCtrl
root.ServiceDefaultValuesShowCtrl   = ServiceDefaultValuesShowCtrl
root.ServiceDefaultValuesEditCtrl   = ServiceDefaultValuesEditCtrl 