'use strict';

finder_services = angular.module 'finder_services'

finder_services.factory 'Girl', [
    '$resource'
    '$upload'
    'FileResource'
    ($resource, $upload, FileResource) ->
        Girl = $resource '/admin/girls/:id', {
                id: '@id'
            }, {
                change_main_photo: {
                    method: 'POST'
                    url: '/admin/girls/:id/change_main_photo'
                },
                update: {method: 'PUT'}
            }
        Girl::update = ->
            @$update =>
                if @file
                    @upload_photo()

        Girl::upload_photo = ->
            options =
                url: "/admin/girls/#{@id}/photos"
                method: 'POST'
                data:
                    file: @file
            @progress = 0
            @uploading = on
            @_uploader = $upload.upload options
            .progress (event) =>
                @progress = Math.round 100 * event.loaded / event.total
            .success (photo, status, headers, config) =>
                unless @photos?
                    @photos = []
                @photos.push photo
                @abort()
                @_uploader = null
                callback @
            .error =>
                @_uploader = null
                @abort()

        Girl::abort = ->
            if @_uploader
                @_uploader.abort()
            @uploading = off
            @progress = 0

        Girl::main_photo = ->
            unless 'number' is (typeof @main_photo_id) and @photos?.length > 0
                return off
            main = _.find @photos, (photo) =>
                photo.id is @main_photo_id
            return main?.url

        Girl::has_category = (category) ->
            unless @categories?.length > 0
                return off
            result = _.find @categories, (_category) ->
                category.category_id is _category.category_id
            return result?

        Girl::delete_file = (file, callback) ->
            file = new FileResource file
            file.$delete =>
                index = null
                @files.forEach (_file, _index) ->
                    if _file.file_id is file.file_id
                        index = _index
                @files.splice index, 1

        Girl
]
