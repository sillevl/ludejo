$(".page.map").ready ->
  window.Monsters = {}

  map.locate({setView: true, watch: true, maxZoom: 16}) 

  onLocationFound = (e) ->
    radius = e.accuracy / 2
    L.circleMarker(e.latlng, {color: "#FF0000", fillOpacity: 1}).addTo(map)
    return

  map.on 'locationfound', onLocationFound

  $.ajax(url: "/api/monsters.json").done (monsters) ->
    for monster in monsters
      pinpoint = L.marker([
          monster.latitude,
          monster.longitude],
          {icon: L.icon(
            iconUrl: "assets/monsters/00000001.jpeg"
            iconSize: [ 48, 48]
            iconAnchor: [ 24, 24 ])
          }
        ).addTo(map);
      window.Monsters[monster.id] = pinpoint