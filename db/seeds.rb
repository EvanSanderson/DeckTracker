# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Player.destroy_all
Deck.destroy_all
Card.destroy_all

evan = Player.create(name: "Evan", wins: 1, losses:1)
christine = Player.create(name: "Christine", wins: 1, losses: 0)

zoolock = Deck.create(name: "Zoolock", wins: 1, losses: 1, character_class: "Warlock", img_url: "http://bit.ly/2aAh5Ql", player: evan)
paladin = Deck.create(name: "MR Paladin", wins: 1, losses: 0, character_class: "Paladin", img_url: "http://bit.ly/2aAhvXe", player: christine)

Card.create(name: "Leeroy Jenkins", effect: "Charge, Battle Cry", img_url: "http://bit.ly/2arr9FM", description: "Summon two 1/1 Whelps for your opponent", attack: 6, defense: 2, mana: 5, rarity: "Legendary", deck: zoolock)
Card.create(name: "Tyrion Fordring", effect: "Divine Shield, Taunt, Deathrattle", img_url: "http://bit.ly/2aziGBT", description: "Equip a 5/3 Ashbringer", attack: 6, defense: 6, mana: 8, rarity: "Legendary", deck: paladin)
