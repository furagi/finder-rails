'use strict'

finder_directives = angular.module 'finder_directives'

elastic = ($timeout) ->
  {
    restrict: 'A',
    link: ($scope, element, attr) ->
      $scope.$watch attr.ngShow, (value) ->
        if value
          $scope.initialHeight = $scope.initialHeight || element[0].style.height;
          resize = ->
            element[0].style.height = $scope.initialHeight;
            element[0].style.height = "" + element[0].scrollHeight + "px";
          element.on("input change", resize);
          $timeout(resize, 0);
  }

finder_directives.directive 'elastic', ['$timeout', elastic]
