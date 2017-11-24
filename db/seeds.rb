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

sources.each do |source|
    puts source
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