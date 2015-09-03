'use strict';

finder_services = angular.module 'finder_services'

finder_services.factory 'Slide', [
    'Restangular'
    '$q'
    (Restangular, $q) ->
        Slide =  Restangular.all 'slides'
        # , {
        #         slide_id: '@file_id'
        #     }, {
        #     }

        Restangular.extendCollection 'slides', (_Slide) ->
            _Slide.create = (params) ->
                file_reader = new FileReader()
                fileReader.onload = (e) ->
                    console.log 'onload', arguments
                fileReader.onloadstart = ->
                    console.log 'onloadstart', arguments
                fileReader.onloadprogress = ->
                    console.log 'onloadprogress', arguments
                fileReader.onerror = ->
                    console.log 'onerror', arguments
                fileReader.readAsArrayBuffer(params.file);
                deferred = $q.defer()
                form_data = new FormData()
                form_data.append 'file', params.file
                Restangular.all('slides')
                    .withHttpConfig({transformRequest: angular.identity})
                    .customPOST(form_data, 'file', undefined, {'Content-Type': undefined})
                    .then (res)->
                        deferred.resolve(res)
                deferred.promise

        # Slide::create = (callback) ->
        #     options = {
        #         url: "/admin/slides"
        #         method: 'POST'
        #         file: @file
        #     }
        #     @progress = 0
        #     @uploading = on
        #     finish = (slide) =>
        #         @_uploader = null
        #         @finished = on
        #         @progress = 0
        #         callback slide
        #     @_uploader = $upload.upload options
        #     .progress (event) =>
        #         @progress = Math.round 100 * event.loaded / event.total
        #     .success (slide, status, headers, config) ->
        #         slide = new Slide slide
        #         finish slide
        #     .error ->
        #         finish()
        #     .then ->
        #         finish()

        # Slide::abort = ->
        #     if @_uploader
        #         @_uploader.abort()

        return Slide
]
