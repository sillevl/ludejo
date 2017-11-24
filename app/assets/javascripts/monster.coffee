$ ->
  window.Monsters = {}

  map.locate({setView: true, watch: true, maxZoom: 16}) 

  onLocationFound = (e) ->
    radius = e.accuracy / 2
    L.marker(e.latlng).addTo(map).bindPopup('You are within ' + radius + ' meters from this point').openPopup()
    L.circle(e.latlng, radius).addTo map
    return

  map.on 'locationfound', onLocationFound

  $.ajax(url: "/api/monsters.json").done (monsters) ->
    for monster in monsters
      pinpoint = L.marker([
          monster.latitude,
          monster.longitude],
          {}
        #   {icon: busIcon}
        ).addTo(map);
      window.Monsters[monster.id] = pinpoint