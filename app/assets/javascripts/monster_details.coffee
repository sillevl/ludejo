$(".monsters.show").ready ->
  monster = {
      id: $("#monster_detail_map").data("monster-id"),
      image: $("#monster_detail_map").data("monster-image"),
      longitude: $("#monster_detail_map").data("monster-latitude"),
      latitude: $("#monster_detail_map").data("monster-longitude")
  }
  window.monster_map = L.map('monster_detail_map').setView([monster.longitude, monster.latitude], 15);

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
