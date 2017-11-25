$(".monsters.show").ready ->
  monster = {
      id: $("#monster_detail_map").data("monster-id"),
      image: $("#monster_detail_map").data("monster-image"),
      longitude: $("#monster_detail_map").data("monster-latitude"),
      latitude: $("#monster_detail_map").data("monster-longitude")
  }
  window.monster_map = L.map('monster_detail_map').setView([monster.longitude, monster.latitude], 15);

  onlocationfound = (e) ->
    window.my_location = { 
      latitude: e.latitude
      longitude: e.longitude
      latlng: e.latlng
    }
    monster_location = L.latLng(monster.longitude, monster.latitude)
    L.circleMarker(e.latlng, {color: "#FF0000", fillOpacity: 1}).addTo(window.monster_map)
    distance = e.latlng.distanceTo(monster_location) 
    $("#distance_to_monster").text(Math.round(distance / 100, 2)/10)
    latlongs = [e.latlng, monster_location]
    polyline = L.polyline(latlongs, {color: "#FF0000", weight: 2}).addTo(window.monster_map);

    if distance > 100
      $('#feed_me').addClass 'disabled'
      $('#feed_me').removeClass 'pulse'
      $('feed_me_text').hide
    else



  window.monster_map.locate() 
  window.monster_map.on('locationfound',onlocationfound)


  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
      maxZoom: 18,
      id: 'mapbox.streets',
      accessToken: 'pk.eyJ1IjoicmVwc2FqamoiLCJhIjoiY2phZTRyaHloMXNieDMzcjF2czdxZmFwMSJ9.Xd4rx5sAMSeK60eO_Qq2yA'
  }).addTo(window.monster_map);

  L.marker([
    monster.longitude,
    monster.latitude],
    {icon: L.icon(
      iconUrl: "/assets/monsters/" + monster.image
      iconSize: [ 48, 48]
      iconAnchor: [ 24, 24 ])
    }
  ).addTo(window.monster_map);
