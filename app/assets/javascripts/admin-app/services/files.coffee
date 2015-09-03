'use strict';

finder_services = angular.module 'finder_services'

finder_services.factory 'FileResource', [
  'Restangular'
  (Restangular) ->
    return Restangular.all 'files'
]
