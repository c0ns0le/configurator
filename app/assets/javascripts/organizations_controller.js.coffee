
root = global ? window

OrganizationsIndexCtrl = ($scope, Organization) ->
  $scope.organizations = Organization.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @organization
      @organization.destroy ->
        $scope.organizations = _.without($scope.organizations, original)
        
OrganizationsIndexCtrl.$inject = ['$scope', 'Organization'];

OrganizationsCreateCtrl = ($scope, $location, Organization) ->
  $scope.save = ->
    Organization.save $scope.organization, (organization) ->
      $location.path "/organizations/#{organization.id}/edit"

OrganizationsCreateCtrl.$inject = ['$scope', '$location', 'Organization'];

OrganizationsShowCtrl = ($scope, $location, $routeParams, Organization) ->
  Organization.get
    id: $routeParams.id
  , (organization) ->
    @original = organization
    $scope.organization = new Organization(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.organization.destroy ->
        $location.path "/organizations"

OrganizationsShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Organization'];

OrganizationsEditCtrl = ($scope, $location, $routeParams, Organization) ->
  Organization.get
    id: $routeParams.id
  , (organization) ->
    @original = organization
    $scope.organization = new Organization(@original)

  $scope.isClean = ->
    console.log "[OrganizationsEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.organization

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.organization.destroy ->
        $location.path "/organizations"

  $scope.save = ->
    Organization.update $scope.organization, (organization) ->
      $location.path "/organizations"

OrganizationsEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Organization'];

# exports
root.OrganizationsIndexCtrl  = OrganizationsIndexCtrl
root.OrganizationsCreateCtrl = OrganizationsCreateCtrl
root.OrganizationsShowCtrl   = OrganizationsShowCtrl
root.OrganizationsEditCtrl   = OrganizationsEditCtrl 