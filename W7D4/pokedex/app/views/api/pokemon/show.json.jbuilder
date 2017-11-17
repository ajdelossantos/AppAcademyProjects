<<<<<<< HEAD
json.pokemon do
  json.id @pokemon.id
  json.name @pokemon.name
  json.attack @pokemon.attack
  json.defense @pokemon.defense
  json.moves @pokemon.moves
  json.image_url asset_path(@pokemon.image_url)
  json.item_ids @pokemon.items.pluck(:id)
end
json.items @pokemon.items do |item|
  json.id item.id
  json.name item.name
  json.pokemon_id item.pokemon_id
  json.price item.price
  json.happiness item.happiness
  json.image_url asset_path(item.image_url)
end
=======
json.pokemon @pokemon, :id, :name, :attack, :defense, :image_url, :moves, :poke_type
json.items @pokemon.items, :id, :name, :pokemon_id, :price, :happiness, :image_url
>>>>>>> 9f24b13ece4548cdc8bab839c8ee0576f85c9a5b
