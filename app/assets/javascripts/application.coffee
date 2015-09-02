# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap
#= require underscore
#= require_tree ./mylibs
#= require_self
#

send_request = (options) ->
    $.ajax options
        .done (result) ->
            if result?.redirect
                document.location = result.redirect
                return
        .fail (result) ->
            console.log 'Error happened'

$ ->
    $('[data-form_submit]').click ->
        $form = $(@).closest '[data-form]'
        url = $form.data 'action'
        method = $form.data 'method'
        fields = $form.find '[data-form_field]'
        data = {}
        fields.each (index, field) ->
            $field = $ field
            source = $field.data 'form_field_source'
            value = ''
            if typeof $field[source] is 'function'
                value = $field[source]()
            else
                value = $field[source]
            default_value = $field.data 'form_field_default_value'
            if value and value isnt '' and value isnt default_value
                data[$field.data 'form_field' ] = value
        if ['patch', 'post'].indexOf(method.toLowerCase()) > -1 and _.isEmpty(data)
            return false
        else
            send_request {url, method, data}

