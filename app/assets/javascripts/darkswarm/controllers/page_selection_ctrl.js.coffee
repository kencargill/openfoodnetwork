Darkswarm.controller "PageSelectionCtrl", ($scope, $location) ->
  $scope.selectedPage = ->
    # The path looks like `/contact` for the URL `https://ofn.org/shop#/contact`.
    # We remove the slash at the beginning.
    page = $location.path()[1..]

    return $scope.whitelist[0] unless page

    # If the path points to an unrelated path like `/login`, stay where we were.
    return $scope.lastPage unless page in $scope.whitelist

    $scope.lastPage = page
    page

  $scope.whitelistPages = (pages) ->
    $scope.whitelist = pages
    $scope.lastPage = pages[0]
