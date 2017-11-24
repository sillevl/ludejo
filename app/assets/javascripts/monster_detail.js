$(document).on('turbolinks:load', function() {
    if(window.location.pathname == "/map") {
        window.mymap = L.map('detail_map').setView([51.505, -0.09], 13);
        
            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
                attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
                maxZoom: 18,
                id: 'mapbox.streets',
                accessToken: 'pk.eyJ1IjoicmVwc2FqamoiLCJhIjoiY2phZTRyaHloMXNieDMzcjF2czdxZmFwMSJ9.Xd4rx5sAMSeK60eO_Qq2yA'
            }).addTo(window.mymap);
    }   
});