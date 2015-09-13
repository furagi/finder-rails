'use strict'

finder_directives = angular.module 'finder_directives'

binder = -> {
    scope: {
        ngModel: '='
    },
    link: (scope, elem, attrs, controller) ->
        elem.on 'keyup keydown', (event) ->
            scope.$apply ->
                scope.ngModel = elem.html().trim()
}

finder_directives.directive 'binder', binder
