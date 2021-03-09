# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

Exchange.destroy_all
Asset.destroy_all
ExchangeAsset.destroy_all

exchangeIds = {
                'bitfinex': [],
                'kraken': [],
                'binance': [],
                'bitflyer': [],
                'bitstamp': [],
                'coinbasepro': [],
              }

puts "Exchanges are #{exchangeIds}"

base_url = 'https://api.coincap.io/v2/markets'
puts "Creating exchanges"
exchangeIds.keys.each do |ex|
  ex_obj = Exchange.create(name: ex)
  puts "Created #{ex_obj.name} exchange"
  puts "Opening Url #{base_url}?exchangeId=#{ex == 'coinbasepro' ? 'gdax' : ex}&limit=2000"
  exchange_assets_seralized = open(
    "#{base_url}?exchangeId=#{ex == :coinbasepro ? 'gdax' : ex}&limit=2000"
    ).read
  puts "Parsing data"
  exchange_assets = JSON.parse(exchange_assets_seralized)
  exchange_assets['data'].each do |exa|
    asset = Asset.create(
                  external_id: exa['baseSymbol']+exa['quoteSymbol'],
                  base: exa['baseSymbol'],
                  quote: exa['quoteSymbol']
                  )
    puts "created asset #{asset.external_id}"
    asset = asset.id ? asset : Asset.find_by(external_id: exa['baseSymbol']+exa['quoteSymbol'])
    exch_ass = ExchangeAsset.create(exchange: ex_obj, asset: asset)
    puts "created exchange asset #{exch_ass.id}"
  end
end

puts "Created #{Exchange.count} exchanges"
puts "Created #{Asset.count} assets"
puts "Created #{ExchangeAsset.count} exchange assets"
