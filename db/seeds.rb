# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

# TODO: should be the URL instead of a file
sources = ["speelruimte.json"]
monster_names = "monster.json"
monster_images = "image.json"

sources.each do |source|
    file = File.join(File.dirname(__FILE__), source)
    data = JSON.parse(File.read(file))
    data.each do |item|
        puts item["ID"].inspect

        monster = {
            id: item["ID"],
            name: "monster #{item["ID"]}",
            latitude: item["json_geometry"]["coordinates"][1],
            longitude: item["json_geometry"]["coordinates"][0]
        }

        Monster.create(monster)
    end
end

monsters = Monster.all
monsters.each_with_index do |monster, index|
    file = File.join(File.dirname(__FILE__), monster_names)
    data = JSON.parse(File.read(file))
    monster.name = data[index]
    monster.health = Random.new.rand(0..100)
    monster.save
end

monsters.each do |monster|
    file = File.join(File.dirname(__FILE__), monster_images)
    data = JSON.parse(File.read(file))
    monster.image = data[Random.new.rand(0..13)]
    monster.save
end