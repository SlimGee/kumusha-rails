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
import 'filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css';

FilePond.registerPlugin(
    FilePondPluginImageExifOrientation,
    FilePondPluginImagePreview
)

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
        document.querySelector('#parent-loader').classList.remove('d-none')

        const files = pond.getFiles()
        const form = new FormData()
        Array.prototype.forEach.call(files, (item) => {
            form.append('images[]', item.file, item.file.name)
        })

        const formElement =  document.querySelector('#form')
        const formElements = formElement.elements

        Array.prototype.forEach.call(formElements, (item) => {
            form.append(item.name, item.value)
        })

        const request = new XMLHttpRequest()
        request.open('POST', formElement.action)
        request.onload = () => {
            console.log(request);
            Turbolinks.visit(request.responseURL)
        }
        request.onprogress = () => {
        }
        request.send(form)
    })
})
