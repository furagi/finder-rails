'use strict';

finder_services = angular.module 'finder_services'

finder_services.factory 'Application', [
    '$resource'
    ($resource) ->
        return $resource '/admin/settings/:id', {
                id: '@id'
            }, {
              update: {method: 'PUT'}
            }
]
