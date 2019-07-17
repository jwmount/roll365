
#
# W R A P U P
#
puts "\n\nLICENSEE: \t#{@licensee}"
puts "Addresses:    \t#{Address.count.to_s}"
puts "Companies:    \t#{Company.count.to_s}"
puts "Comments:     \t#{Comment.count.to_s}"
puts "Conditions:   \t#{Condition.count.to_s}"
puts "Equipment:    \t#{Equipment.count.to_s}"
puts "Identifiers:  \t#{Identifier.count.to_s}"
puts "Materials:    \t#{Material.count.to_s}"
puts "People:       \t#{Person.count.to_s}"
puts "Shipments:    \t#{Shipment.count.to_s}"
puts "Tips:         \t#{Tip.count.to_s}"
#puts "Users:        \t#{AdminUser.count.to_s}"
puts "\n\n --Summary Done"
