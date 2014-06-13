
root = global ? window

ModifiedValuesIndexCtrl = ($scope, ModifiedValue) ->
  $scope.modified_values = ModifiedValue.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @modified_value
      @modified_value.destroy ->
        $scope.modified_values = _.without($scope.modified_values, original)
        
ModifiedValuesIndexCtrl.$inject = ['$scope', 'ModifiedValue'];

ModifiedValuesCreateCtrl = ($scope, $location, ModifiedValue) ->
  $scope.save = ->
    ModifiedValue.save $scope.modified_value, (modified_value) ->
      $location.path "/modified_values/#{modified_value.id}/edit"

ModifiedValuesCreateCtrl.$inject = ['$scope', '$location', 'ModifiedValue'];

ModifiedValuesShowCtrl = ($scope, $location, $routeParams, ModifiedValue) ->
  ModifiedValue.get
    id: $routeParams.id
  , (modified_value) ->
    @original = modified_value
    $scope.modified_value = new ModifiedValue(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.modified_value.destroy ->
        $location.path "/modified_values"

ModifiedValuesShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'ModifiedValue'];

ModifiedValuesEditCtrl = ($scope, $location, $routeParams, ModifiedValue) ->
  ModifiedValue.get
    id: $routeParams.id
  , (modified_value) ->
    @original = modified_value
    $scope.modified_value = new ModifiedValue(@original)

  $scope.isClean = ->
    console.log "[ModifiedValuesEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.modified_value

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.modified_value.destroy ->
        $location.path "/modified_values"

  $scope.save = ->
    ModifiedValue.update $scope.modified_value, (modified_value) ->
      $location.path "/modified_values"

ModifiedValuesEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'ModifiedValue'];

# exports
root.ModifiedValuesIndexCtrl  = ModifiedValuesIndexCtrl
root.ModifiedValuesCreateCtrl = ModifiedValuesCreateCtrl
root.ModifiedValuesShowCtrl   = ModifiedValuesShowCtrl
root.ModifiedValuesEditCtrl   = ModifiedValuesEditCtrl 