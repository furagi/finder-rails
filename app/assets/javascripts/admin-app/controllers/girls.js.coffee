'use strict'


GirlsCtrl = ($scope, Girl, Category) ->
    update_categories = ->
        $scope.current._categories = {
        }
        _.each $scope.categories, (category) ->
            unless $scope.current.category_ids?.length
                $scope.current._categories[category.id] = off
                return
            contains = $scope.current.category_ids.indexOf(category.id) isnt -1
            $scope.current._categories[category.id] = contains

    $scope.girl_exists = ->
        'number' is typeof $scope.current?.id

    $scope.edit = (girl) ->
        $scope.current = girl
        index = $scope.girls.indexOf girl
        if index isnt -1
            $scope.girls[index].editing = on
        update_categories()

    validate = (girl) ->
        unless typeof girl.name is 'string' and girl.name isnt ''
            alert "Fill name first"
            return off
        unless typeof girl.description is 'string' and girl.description isnt ''
            alert "Fill description first"
            return off
        return on

    collect_categories = (girl) ->
        category_ids = []
        categories = $scope.categories.map (category) -> category.id
        _.each girl._categories, (has, id) ->
            if categories.indexOf(+id) is -1
                delete girl._categories[id]
            else if has
                category_ids.push +id
        return category_ids

    $scope.create = ->
        unless validate($scope.current)
            return
        $scope.current.category_ids = collect_categories($scope.current)
        $scope.current.$save (girl) ->
            $scope.girls.push girl
            $scope.current = girl
            update_categories()

    $scope.update = ->
        unless validate($scope.current)
            return
        $scope.current.category_ids = collect_categories($scope.current)
        $scope.current.update()

    $scope.destroy = (girl) ->
        index = $scope.girls.indexOf girl
        girl.$delete ->
            if girl.editing
                $scope.clear()
            $scope.girls.splice index, 1

    $scope.add_file = ($files) ->
        $scope.current.file = $files[0]

    $scope.delete_file = (file) ->
        $scope.current.delete_file file, ->
            unless $scope.current.id?
                return
            _.each $scope.girls, (girl, index) ->
                if girl.id is $scope.current.id
                   $scope.girls[index] = $scope.current

    $scope.clear = ->
        $scope.edit(new Girl())

    $scope.change_main_photo = (file) ->
        i = -1
        _.find $scope.girls, (girl, _i) ->
            if girl.id is file.id
                i = _i
                return on
        if i isnt -1
            $scope.girls[i].$change_main_photo {file_id: file.file_id}

    $scope.girls = Girl.query()
    $scope.clear()

finder_controllers = angular.module 'finder_controllers'
finder_controllers.controller 'GirlsCtrl', [
    '$scope'
    'Girl'
    'Category'
    GirlsCtrl
]
