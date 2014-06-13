
root = global ? window

ServicesIndexCtrl = ($scope, Service) ->
  $scope.services = Service.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @service
      @service.destroy ->
        $scope.services = _.without($scope.services, original)
        
ServicesIndexCtrl.$inject = ['$scope', 'Service'];

ServicesCreateCtrl = ($scope, $location, Service) ->
  $scope.save = ->
    Service.save $scope.service, (service) ->
      $location.path "/services/#{service.id}/edit"

ServicesCreateCtrl.$inject = ['$scope', '$location', 'Service'];

ServicesShowCtrl = ($scope, $location, $routeParams, Service) ->
  Service.get
    id: $routeParams.id
  , (service) ->
    @original = service
    $scope.service = new Service(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.service.destroy ->
        $location.path "/services"

ServicesShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Service'];

ServicesEditCtrl = ($scope, $location, $routeParams, Service) ->
  Service.get
    id: $routeParams.id
  , (service) ->
    @original = service
    $scope.service = new Service(@original)

  $scope.isClean = ->
    console.log "[ServicesEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.service

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.service.destroy ->
        $location.path "/services"

  $scope.save = ->
    Service.update $scope.service, (service) ->
      $location.path "/services"

ServicesEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Service'];

# exports
root.ServicesIndexCtrl  = ServicesIndexCtrl
root.ServicesCreateCtrl = ServicesCreateCtrl
root.ServicesShowCtrl   = ServicesShowCtrl
root.ServicesEditCtrl   = ServicesEditCtrl 