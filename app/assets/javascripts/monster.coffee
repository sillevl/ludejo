$ ->
  window.Monsters = {}

  $.ajax(url: "/api/monsters.json").done (monsters) ->
    for monster in monsters
      pinpoint = L.marker([
          tracker.last_coordinate.latitude,
          tracker.last_coordinate.longitude],
          {icon: busIcon}
        ).addTo(map);
      window.Monsters[tracker.deveui] = pinpoint