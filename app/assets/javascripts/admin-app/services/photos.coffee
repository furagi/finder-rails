'use strict';

finder_services = angular.module 'finder_services'

finder_services.factory 'Photo', [
    '$resource'
    '$upload'
    ($resource, $upload) ->
        Photo =  $resource '/admin/girls/:girl_id/photos/:id', {
                girl_id: '@girl_id'
                id: '@id'
            }, {
            }
        return Photo
]
