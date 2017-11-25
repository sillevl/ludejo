$(".page.map").ready ->
  window.Monsters = {}

  map.locate({setView: true, watch: true, maxZoom: 16}) 

  onLocationFound = (e) ->
    radius = e.accuracy / 2
    L.circleMarker(e.latlng, {color: "#FF0000", fillOpacity: 1}).addTo(map)
    return
  
  monster_click = (e) ->
    console.log(e.target.options.id)
    id = e.target.options.id
    window.location.href = "/monsters/" + id

  map.on 'locationfound', onLocationFound

  $.ajax(url: "/api/monsters.json").done (monsters) ->
    for monster in monsters
      pinpoint = L.marker([
          monster.latitude,
          monster.longitude],
          {id: monster.id,
          icon: L.icon(
            iconUrl: "/assets/monsters/" + monster.image
            iconSize: [ 48, 48]
            iconAnchor: [ 24, 24 ])
          }
        ).on('click', monster_click).addTo(map);
      window.Monsters[monster.id] = pinpoint