'use strict';

finder_services = angular.module 'finder_services'

finder_services.factory 'Category', [
  'Restangular'
  (Restangular) ->
    return Restangular.all 'categories'
]
