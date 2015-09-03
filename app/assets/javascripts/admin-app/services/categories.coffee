'use strict';

finder_services = angular.module 'finder_services'

finder_services.factory 'Category', [
    '$resource'
    ($resource) ->
        return $resource '/admin/categories/:id', {
                id: '@id'
            }, {
              update: {method: 'PUT'}
            }
]
