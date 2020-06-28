// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

window.$ =  window.jQuery = require('jquery')
window.Popper = require('popper.js')
require('bootstrap')
require('owl.carousel')
require('jquery-touchswipe')
require('./bs.touch.swipe')
window.Swiper = require('swiper')
window.toastr = require('toastr')

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(document).ready(() => {
    $('#startSearch').on('click', () => {
        let place = $('#city').val()
        let price = $('#price').val()
        if (place.length > 1 && price.length > 1) {
            Turbolinks.visit(window.location.origin.concat('/properties?q=').concat(place).concat('&price=').concat(price))
        } else if (place.length > 1) {
            Turbolinks.visit(window.location.origin.concat('/properties?q=').concat(place))
        }
        else {

        }
    })

    let form = document.querySelector('#contactForm')
    form.addEventListener('ajax:complete', (event) => {
        Array.prototype.map.call(form.elements, (field) => {
            field.value = ''
        })
        toastr.success('Thank you for your message')
    })
})
