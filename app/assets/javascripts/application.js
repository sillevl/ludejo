// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require leaflet
//= require rails-ujs
//= require turbolinks
//= require materialize-sprockets
//= require_tree .

$(document).on('turbolinks:load', function() {
    $(".button-collapse").sideNav();
    $(".dropdown-button").dropdown();

    if(window.location.pathname == "/") {
        document.getElementsByTagName("body")[0].setAttribute("id", "homepage");
    }
    if(window.location.pathname == "/monsters") {
        document.getElementsByTagName("body")[0].setAttribute("id", "monsters");
    }

    if (window.location.href.indexOf('#_=_') > 0) {
        window.location = window.location.href.replace(/#.*/, '');    
    }
});
