# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    mymap = L.map('map').setView([51.20892, 3.25449], 13)

    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}',
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>'
    maxZoom: 18
    id: 'mapbox.streets'
    accessToken: 'pk.eyJ1IjoiaGFwbWVpc3RlciIsImEiOiJjajl4eWNmaDI4OW9iMzN0NGJhOWd1Yzk1In0.HIRvN5v7uZ7QDBVXS8XhYA').addTo mymap

    playground_1 = L.marker([51.2084990233627, 3.19486174948167]).addTo(mymap)

    playground_2 = L.marker([51.2011321806766, 3.18070896401319]).addTo(mymap)

    
