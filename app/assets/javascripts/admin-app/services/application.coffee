'use strict';

finder_services = angular.module 'finder_services'

finder_services.factory 'Application', [
  'Restangular'
  (Restangular) ->
    return Restangular.all 'settings'
]
