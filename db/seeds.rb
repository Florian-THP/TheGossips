# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Like.destroy_all
# Comment.destroy_all
# Gossip.destroy_all
# Tag.destroy_all

Like.destroy_all
Comment.destroy_all

# Supprimer les liens entre les gossips et les tags (gossip_tags)
GossipTag.destroy_all # Assurez-vous que GossipTag est le modèle approprié pour les associations.

# Ensuite, supprimez les gossips et les tags
Gossip.destroy_all
Tag.destroy_all
User.destroy_all
City.destroy_all
# PrivateMessage.destroy_all

# b) LES USERS
city1 = City.create(name: 'Paris', zip_code: '75000')
city2 = City.create(name: 'Lyon', zip_code: '69000')
city3 = City.create(name: 'Marseille', zip_code: '13000')
city4 = City.create(name: 'Bordeaux', zip_code: '33000')
city5 = City.create(name: 'Nantes', zip_code: '44000')
city6 = City.create(name: 'Toulouse', zip_code: '31000')
city7 = City.create(name: 'Nice', zip_code: '06000')
city8 = City.create(name: 'Lille', zip_code: '59000')
city9 = City.create(name: 'Strasbourg', zip_code: '67000')
city10 = City.create(name: 'Rennes', zip_code: '35000')






# e) LES TAGS
tag1 = Tag.create(title: '#fun')
tag2 = Tag.create(title: '#scandal')
tag3 = Tag.create(title: '#drama')
tag4 = Tag.create(title: '#romance')
tag5 = Tag.create(title: '#mystery')
tag6 = Tag.create(title: '#comedy')
tag7 = Tag.create(title: '#bromance')
tag8 = Tag.create(title: '#action')
tag9 = Tag.create(title: '#thriller')
tag10 = Tag.create(title: '#adventure')
