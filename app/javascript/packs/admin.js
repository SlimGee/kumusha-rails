require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

window.$ =  window.jQuery = require('jquery')
window.Popper = require('popper.js')
require('bootstrap')
require('startbootstrap-sb-admin-2/js/sb-admin-2')
require('jquery.easing')
window.Chart = require('chart.js')

import "@fortawesome/fontawesome-free/js/all";

import * as FilePond from 'filepond';

import FilePondPluginImagePreview from 'filepond-plugin-image-preview';
import FilePondPluginImageExifOrientation from 'filepond-plugin-image-exif-orientation';

// Register the plugin

// Import the plugin styles
import 'filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css';

// Register the plugin
FilePond.registerPlugin(FilePondPluginImagePreview);
FilePond.registerPlugin(FilePondPluginImageExifOrientation);

// Register the plugin

$(document).on('turbolinks:load', () => {
    const inputElement = document.querySelector('input[type="file"]');

    // create a FilePond instance at the input element location
    window.pond = FilePond.create( inputElement, {
        maxFiles: 10,
        allowBrowse: true,
        allowMultiple: true,
    });

    $('#form').on('submit', (e) => {
        e.preventDefault()
        e.stopPropagation()

        const files = pond.getFiles()
        const form = new FormData()
        Array.prototype.forEach.call(files, (item) => {
            form.append('images[]', item.file, item.file.name)
        })
        const formElements = document.querySelector('#form').elements
        Array.prototype.forEach.call(formElements, (item) => {
            form.append(item.name, item.value)
        })

        const request = new XMLHttpRequest()
        request.open('POST', '/admin/properties')
        request.onload = () => {
            console.log(request);
            Turbolinks.visit(request.responseURL)
        }
        request.onprogress = () => {
            document.querySelector('#parent-loader').classList.remove('d-none')
        }
        request.send(form)
    })
})
