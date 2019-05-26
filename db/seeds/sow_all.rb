# sow_all_seeds
# $ rake db:demo:sow_all_seeds
# $ heroku run bundle eec rake db:demo2
#
# D I R E C T O R Y   C O M P A N I E S
# 
# Format here works well for company listings in Directories.   
# Array of hashes, each contains four hashes "company", "address", "person", and "identifier".
# First company is our licensee, this admittedly fragile rule, is/was? used next to determine this status.
# Note:  hash values cannot be duplicates so cannot have two "Identifiers" for example.
#


# [TODO ]-- Create a Licensee Setup sequence better than this static approach.
# Note that here the Rep is named 'Account Representative' and this needs to be edited to make any 
# sense once the account gets used by someone.

@licensee = "Valley Farm Transport"
@lob = "Farm transport"
@url = "www.ValleyTransport.com"

companies_list = [
# LICENSEE - This cannot be DRY with config/boots.rb, at least until we figure out how to use the 
# ENV[] attributes.
=begin
  { "company"    => { licensee: true, 
                      name: @licensee, line_of_business: @lob, url: @url},
    "address"    => { street_address: "t.b.d.", city: "Dixon", state: "CA", post_code: ""},
    "person"     => { first_name: "Account", last_name: "Representative", title: "Rep"},
    "identifier" => { name: "Office", value: "415 555-1212"}
    },
=end 
# COMPANIES IN MARKET AREA
companies_list = 
  { "company"    => { name: "1st Logistics", line_of_business: "Over-the-road transportation services", url: "www.truckcompaniesin.com/dot/1175905/"},
    "address"    => { street_address: "2001 Meyer Way", city: "Fairfield", state: "CA", post_code: "94533" },
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "(707) 853-6712"}
    }, 
  { "company"    => { name: "American Debris Box Service Inc.", line_of_business: "Containers delivered and removed", url: "americandebrisbox.com/"},
    "address"    => { street_address: "PO Box 3187", city: "Half Moon Bay", state: "CA", post_code: "94019" },
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "866-332-7471"}
    }, 
  { "company"    => { name: "Blue Line Transfer", line_of_business: "Cartage, waste removal & recycling service", url: ""},
    "address"    => { street_address: "500 E. James Court", city: "South San Francisco", state: "CA", post_code: "94080"},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "t.b.d."}
    }, 
  { "company"    => { name: "Lawson Drayage, Inc.", line_of_business: "Machinery Moving, Rigging, & Heavy Transportation for any Industry",
                      url: "lawsoninc.com"},
    "address"    => { street_address: "3402 Enterprise Avenue", city: "Hayward", state: "CA", post_code: "94545"},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "510-785-5100 "}
    }, 
  { "company"    => { name: "Waste Management, Inc.", line_of_business: "Waste Disposal & Removal Service", url: "www.wm.com"},
    "address"    => {},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "t.b.d."}
    }, 
  { "company"    => { name: "Reliable Crane & Rigging", line_of_business: "Carting, Hoist Service & Rental, Machinery Moving & Erecting Service", url: " www.reliablecrane.com"},
    "address"    => {},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "800 222-7263"}
    }, 
  { "company"    => { name: "Foothill Disposal Co. Inc.", line_of_business: "Cartage Service", url: "www.norcalwaste.com"},
    "address"    => {},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "t.b.d."}
    }, 
  { "company"    => { name: "BWRS", line_of_business: "Debris box, compactors, recycling", url: "www.bwrs.com/"},
    "address"    => {},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "t.b.d."}
    }, 
  { "company"    => { name: "Pleasanton Garbage Serivice, Inc.", line_of_business: "Waste Transport Service", url: "www.pleasantongarbageservices.com"},
    "address"    => { street_address: "3110 Busch Road", city: "Pleasanton", state: "CA", post_code: "94566"},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "(925) 846-2042"}
    }, 
  { "company"    => { name: "Dillard Trucking, Inc.", line_of_business: "Hazardous Waste Transport", url: "dillardenv.com"},
    "address"    => { street_address: "3120 Camino Diablo Road, PO Box 579", city: "Byron", state: "CA", post_code: "94514"},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "925 634-6850"}
    }, 
  { "company"    => { name: "Gan-Trans Ltd.", line_of_business: "Cartage Services (not local)", url: ""},
    "address"    => { street_address: "800 Carden St.", city: "San Leandro", state: "CA", post_code: "94577"},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "510 357-3100"}
    }, 
  { "company"    => { name: "Precision Crane Service", line_of_business: "Crane & Freight Carrier Service", url: ""},
    "address"    => { street_address: "", city: "San Rafael", state: "CA", post_code: "94901"},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "415 457-0702"}
    }, 
  { "company"    => { name: "East Bay Sanitary Co., Inc.", line_of_business: "Cartage, Waste Disposal & Removing Service", url: "www.ebsan.com"},
    "address"    => { street_address: "PO Box 1316, 1432 Kearny St.", city: "El Cerrito", state: "CA", post_code: "94530"},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "510.237.4321"}
    }, 
  { "company"    => { name: "Vallejo Garbage Service", line_of_business: "Cartages Service", url: ""},
    "address"    => { street_address: "2021 Broadway St.", city: "Vallejo", state: "CA", post_code: "94589"},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "707 552-3110"}
    }, 
  { "company"    => { name: "Fred Haines & Company", line_of_business: "Cartage Service", url: "hainesinc.com"},
    "address"    => { street_address: "40434 Brickyard Dr", city: "Madera", state: "CA", post_code: "93636"},
    "person"     => { first_name: "Jason", last_name: "Haines", title: "Dispatcher"},
    "identifier" => { name: "Main Office", value: "(559) 451-0100"}
    }, 
  { "company"    => { name: "Specialty Solid Waste & Recycling", line_of_business: "Waste Handling, Cartage, Waste Disposal Service", url: "www.sswr.com"},
    "address"    => { street_address: "3355 Thomas Road", city: "Santa Clara", state: "CA", post_code: "95054"},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "408.565.9900"}
    }, 
  { "company"    => { name: "Tight Access Excavation", line_of_business: "Residential - Commercial", url: ""},
    "address"    => { street_address: "8140 SE 51ST AVE", city: "Portland", state: "OR", post_code: "97206"},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "(503) 287-4836"}
    }, 
  { "company"    => { name: "Hazel Construction", line_of_business: "Residential Construction", url: "hazel-construction.hub.biz/"},
    "address"    => { street_address: "70 Greenfield Ave.", city: "San Anselmo", state: "CA", post_code: ""},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "415 457-2086"}
    }, 
  { "company"    => { name: "TMT Industries", line_of_business: "Residential Construction", url: ""},
    "address"    => { street_address: "14859 Whittram Ave.", city: "Fontana", state: "CA", post_code: "92335"},
    "person"     => { last_name: "t.b.d."},
    "identifier" => { name: "Main Office", value: "t.b.d."}
    }, 
# East Bay Book of Lists
  { "company"    => { name: "O.C. Jones & Sons Inc.", line_of_business:  "Heavy civil construction", url: "www.ocjones.com" },
    "address"    => { street_address: "1520 Fourth St.", city: "Berkeley", state: "CA", post_code: "94710" },
    "person"     => { first_name: "Kelly", last_name: "Kolander", title: "CEO" },
    "identifier" => { name: "Main Company", value: "510 526-3424", rank: 1 }
  },
  { "company"    => { name: "Bay Cities Paving & Grading Inc.", line_of_business:   "General engineering, heavy construction", url: "NR"},
    "address"    => { street_address: "5029 Forni Drive", city: "Concord", state: "CA", post_code: "94520" },
    "person"     => { first_name: "Ben", last_name: "Rodrigues Jr.", title: "President" },
    "identifier" => { name: "Main Company", value: "925 687-6666", rank: 1 }
  },
  { "company"    => { name: "S&S Supplies and Solutions", line_of_business: "Industrial supplies and services", url: "www.supliesandsolutions.com"},
    "address"    => { street_address: "501 Shell Ave", city: "Martinez", state: "CA", post_code: "94553"},
    "person"     => { first_name: "Tracy", last_name: "Tomkovicz", title: "CEO" },
    "identifier" => { name: "Main Company", value: "925 687-6666", rank: 1 }
  },
  { "company"    => { name: "McGuire and Hester", line_of_business: "Heavy civi engineering and construction services", url: "www.mandhcorp.com"},
    "address"    => { street_address: "9009 Railroad Ave.", city: "San Ramon", state: "CA", post_code: "94583"},
    "person"     => { first_name: "Michael", last_name: "Hester", title: "President"},
    "identifier" => { name: "email", value: "pres@mandhcorp.com", rank: 1}
  },
  { "company"    => { name: "Shames Construction Co. Ltd.", line_of_business: "Commercial general contractor", url: "www.shames.com"},
    "address"    => { street_address: "5826 Brisa St.", city: "Livermore", state: "CA", post_code: "94550"},
    "person"     => { first_name: "Carolyn", last_name: "Shames", title: "President and CEO"},
    "identifier" => { name: "Main Number", value: "925 606-3000", rank: 1}
  },
  { "company"    => { name: "James E. Roberts - Obayashi Corp.", line_of_business: "General construction", url: "www.robertsobayashi.com"},
    "address"    => { street_address: "20 Oak Court", city: "Danville", state: "CA", post_code: "94526"},
    "person"     => { first_name: "Scott", last_name: "Smith"},
    "identifier" => { name: "Main Number", value: "925 820-0600", rank: 1}
    },
  { "company"    => { name: "Engineering/Remediation Resources Group Inc.", line_of_business: "Environmental construction and engineering", url: "www.errg.com"},
    "address"    => { street_address: "4585 Pacheco Blvd., Suite 200", city: "Martinez", state: "CA", post_code: "94553"},
    "person"     => { first_name: "Cynthia", last_name: "Liu"},
    "identifier" => { name: "Main Number", value: "925 969-0750", rank: 1}
  },
  { "company"    => { name: "Paradigm General Contractors", line_of_business: "General contractor", url: "www.paradigmgc.com"},
    "address"    => { street_address: "1017 MacDonald Ave.", city: "Richmond", state: "CA", post_code: "94801"},
    "person"     => { first_name: "Karla", last_name: "Deshon"},
    "identifier" => { name: "Main Number", value: "510-478-1121", rank: 1}
  }
]

# 
# Create Rep once licensee company exists
#
companies_list.each do |model| 
  
  @company = Company.find_or_initialize_by( model["company"] )

  begin
    @company.save!
  rescue ActiveRecord::RecordInvalid => e
    if e.message == 'Validation failed: Name has already been taken'
      puts e
      next
    end
  end
      
  @address = @company.addresses.find_or_initialize_by( model["address"] )
  begin
    @address.save!
  rescue ActiveRecord::RecordInvalid => e
    if e.message == 'Validation failed.'
      puts e
      next
    end
  end  


  @identifier = @company.identifiers.find_or_initialize_by( model["identifier"] )
  begin
    @identifier.save!
  rescue ActiveRecord::RecordInvalid => e
    if e.message == 'Validation failed.'
      puts e
      next
    end
  end  
 
  @person = @company.people.find_or_initialize_by( model["person"])
  begin
    @person.save!
  rescue ActiveRecord::RecordInvalid => e
    if e.message == 'Validation failed. Name already taken.'
      puts e
      next
    end
  end  
  
  @address = @person.addresses.find_or_initialize_by( model["address"] )
  begin
    @address.save!
  rescue ActiveRecord::RecordInvalid => e
    if e.message == 'Validation failed.'
      puts e
      next
    end
  end  

end

 


#
# Material types  
#
[
  "Clean Fill",
  "Clean Compactable Fill",
  "General Fill",
  "Shale",
  "Clay Fill",
  "Spoil",
  "Unsuitable Rocky Fill",
  "Unsuitable Clay Fill",
  "Unsuitable Fill",
  "Unsuitable Spoil",
  "Unsuitable Material",
  "Top Soil ",
  "Screened Top Soil",
  "Unscreened Top Soil",
  "Clay Topsoil",
  "Mulch Fine",
  "Mulch Coarse",
  "Mulch Dirty",
  "Green Waste",
  "Green Waste Tree Stumps, Palms or Root Balls",
  "C&D Waste",
  "C&D Waste 20%  and under Concrete",
  "C&D Waste 21% and over Concrete",
  "Timber ",
  "Steel ",
  "Rubbish",
  "Clean Concrete",
  "Dirty Concrete",
  "Concrete Light Grade",
  "Concrete Heavy Grade",
  "Contaminated Soil",
  "Contaminated Soil Heavy Metals",
  "Contaminated Soil Petroleum ",
  "Asbestos contaminated Soil",
  "Asbestos ",
  "Acid Sulphate Fill",
  "Acid Sulphate Fill Over Optimum",
  "Lime Treated Acid Sulphate Fill",
  "Sand",
  "Clean Sand Free of contaminates",
  "Coarse Sand",
  "Fine Sand",
  "White Sand",
  "Washed Sand",
  "Beach Sand",
  "Coal stone",
  "Over Optimum Fill",
  "Over Burden",
  "CBR 0 to 4 Material",
  "CBR 5 to 8 Material",
  "CBR 8 to 10 Material",
  "CBR 10+ Material",
  "CBR 15+ Material",
  "CBR 20+ Material",
  "CBR 30+ Material",
  "CBR 40+ Material",
  "Select Fill",
  "Select Fill ( Unscreened Deco)",
  "Select Fill ( Screened Deco)",
  "Select Fill ( Sandstone Product)",
  "Select Fill ( Coal Stone)",
  "Bitumen",
  "Cold Mix Asphalt",
  "Hot Mix Asphalt",
  "Road Base",
  "Crusher Dust, Concrete",
  "5mm Crushed Concrete",
  "10mm Crushed Concrete",
  "20mm Crushed Concrete",
  "40mm Crushed Concrete",
  "70mm Crushed Concrete",
  "Crusher Dust",
  "5mm Crushed Rock",
  "10mm Crushed Rock",
  "20mm Crushed Rock",
  "40mm Crushed Rock",
  "70mm Crushed Rock",
  "150mm Crushed Rock",
  "300mm Minus Crushed Rock",
  "Shot Rock",
  "Large Rock, Boulders",
  "2.5 Gravel ",
  "2.3 Gravel,CBR 45",
  "2.1 Gravel, CBR 80",
  "Potable Water",
  "Non Potable Water",
  "Recycled Water",
  "Indurated Sand",
  "Rock Institute",
  "As Directed",
  "Sandy Fill"
].each do |name|
  material = Material.find_or_create_by!( name: name )
  material.save!
end

puts "\n\nConditions\n\n"
# Conditions
# Fire Ants verbiage text is composed at run time.
[
 [
   "Himalayan Raspbery",
   "If present this quote includes cost to remove and transport them.",
   "Varies"
 ],
  [
   "Fire Ants",
   "If fire ants are present this quote includes that cost.",
   "Required"
 ],
 [
   "Client Signature",
   "Note:  A REPRESENTATIVE FROM CLIENT CONTRACTORS IS REQUIRED TO SIGN ALL INVOICES.",
   "Required"
 ],
 [
   "Standard Contract Terms for Load Cart and Dispose",
   "Load, Cart and Dispose Conditions: 9 hr working day. Minimum delays on site to facilitate quick entry and exit. Should delays occur due to no fault of the subcontractor, the charge will revert to current hourly hire rates. Any subsequent charges e.g. tip fees, tolls, etc will be charged individually. The Client agrees to provide exclusive access to the total volume of materials on site as quoted above. The Client is responsible for all supervision, direction and project management on the site. Roster365 (AUST) Pty Ltd will provide a 20-30T Excavator to load only, under the supervision and direction of the Client or their authorised representative. The client agrees to indemnify Roster365 (AUST) Pty Ltd from any damage claims in respect to injury of person/s or damage to property and/or utilities resultant from all excavation and cartage works provided. The client is responsible for all sediment control, traffic control & dust suppression as required. All material rates are quoted in loose cubic meters or tons. All quotes are subject to material acceptance by Import Site. All prices are based on statutory legal loads. Material to be in accordance with EPA/DPI guidelines. Quotation is valid for 30 days.",
   "Load, Cart and Dispose"
 ],
 [
   "Standard Contract Terms for Export",
   "9 hr working day. Minimum delays on site to facilitate quick entry, loading (minimum 20 ton excavator loading) and exit. Should delays occur due to no fault of the subcontractor, the charge will revert to current hourly hire rates. Any subsequent charges e.g. tip fees, tolls, etc will be charged individually. The quoted price is based on a maximum of five (5) minutes to load each Tandem, Truck & Trailer or Semi Tipper. All material rates are quoted in loose cubic meters or tonnes. All quotes are subject to material acceptance by Import Site. All prices are based on statutory legal loads. Material to be in accordance with EPA/DPI guidelines. Quotation is valid for 30 days.",
   "Export"
 ],
 [
   "Standard Contract Terms for Import",
   "Import Conditions: 9 hr working day. Minimum delays on site to facilitate quick entry, unloading and exit. Should delays occur due to no fault of the subcontractor, the charge will revert to current hourly hire rates. Any subsequent charges e.g. tip fees, tolls, etc will be charged individually. The quoted price is based on a maximum of five (5) minutes to unload each Tandem, Truck & Trailer or Semi Tipper. All material rates quoted in loose cubic meters or tonnes. All prices are based on statutory legal loads. Material to be in accordance with EPA & DPI guidelines. Quotation is valid for 30 days.",
   "Import"
 ],
 [
   "Standard Contract Terms for Cart Only",
   "Cart Only Conditions: 9 hr working day. Minimum delays on site to facilitate quick entry, loading (minimum 20 tonne excavator loading), unloading and exit. Should delays occur due to no fault of the subcontractor, the charge will revert to current hourly hire rates. Any subsequent charges e.g. tip fees, tolls, etc will be charged individually. The quoted price is based on a maximum of five (5) minutes to load & unload each Tandem, Truck & Trailer or Semi Tipper. Material quantity quoted in loose cubic meters or tonnes. All prices are based on statutory legal loads. Material to be in accordance with EPA &DPI guidelines. Quotation is valid for 30 days.",
   "Cart Only"
 ],
 [
   "Budget Price Only",
   "This price has been prepared using current market options and conditions. The price, options and conditions may differ at the time of works.",
   "Budget Price"
 ],
 [
   "Hourly Hire",
   "Minimum 4 hours. 2 hour cancellation fee. Any subsequent charges e.g. tip fees, tolls, etc will be charged individually.  All prices are based on statutory legal loads. Minimum of half an hour travel time will be charged on all trucks supplied. Night works will incur additional 20% surcharge. Material to be in accordance with EPA/DPI guidelines. Quotation is valid for 30 days.",
   "Hourly Hire"
 ],
 [
   "Machine Hire - Wet",
   "Machine Wet Hire Conditions: Minimum 4 hours. 2 hour cancellation fee. Any subsequent charges e.g. float fees, establishment costs etc will be charged individually. Night works will incur additional 20% surcharge. Material to be in accordance with EPA & DPI guidelines. Quotation is valid for 30 days. A two way float applies to machine hire 4 days and under. Ground engaging Tools (ripper boots, cutting edges etc) will be charged individually.",
   "Machine Hire - Wet"
 ],
 [
   "Machine Hire - Dry, Uninsured",
   "Maximum of 40hrs per week. The Hirer is responsible for theft, loss and damage to plant and its attached tools and accessories whilst on hire and the costs of replacement or repairs to such will be charged to the Hirer. No damage waiver insurance has been taken out by hirer with any damage costs to be paid by hirer. Stand down rates do not apply to Dry Hire unless agreed in writing. Float Fees, Tolls etc will be charged individually. A two way float applies to machine hire 4 days and under. Ground engaging Tools (ripper boots, cutting edges etc) will be charged individually.",
   "Machine Hire - Dry, Uninsured"
 ],
 [
   "Machine Hire - Dry, Insured",
   "Machine Dry Hire Conditions: Maximum of 40hrs per week.  Stand down rates do not apply to Dry Hire unless agreed in writing. Float Fees, Tolls etc will be charged individually. The Supplier offers protection against damage or malicious damage by third parties. This waiver is in the form of a 12% Surcharge on the invoiced hire. An Excess of $600.00 per item or 12% of quoted price, whichever is the higher will apply. This Property Damage Waiver does not cover Burglary or Theft of the Equipment. The Hirer is responsible for theft, loss and damage to plant and its attached tools and accessories whilst on hire and the costs of replacement or repairs to such will be charged to the Hirer. A two way float applies to machine hire 4 days and under. Ground engaging Tools (ripper boots, cutting edges etc) will be charged individually.",
   "Machine Hire - Dry, Insured"
 ],
 [
   "Free Tip - Private Customers",
   "Conditions: Material is to be supplied and placed as directed, at the time of tipping, by the property owner or their representative. If no representative is available, all effort will be made to ensure material is placed and spread in a previously designated, and owner directed, area. roster365 has been requested to arrange supply of material to the above address by the property owner or their representative. roster365 does not take responsibility for material tipped by others. The property owner confirms that this project has the relevant Government or Council approvals. ",
   "Free Tip - Private Customers"
 ],
 [
   "COD, Credit Card Accounts",
   "Credit Card Conditions: A 2% credit card surcharge applies to payments made by Visa or Mastercard. Roster365 does not accept American Express, Diners Club or Bankcard payments.",
   "COD, Credit Card Accounts"
 ],
].each do |condition|
  Condition.create!(:name => condition[0], :verbiage => condition[1], :indication => condition[2], change_approved_at: Date.today)
end

=begin
#
# R O L E S
# [TODO] Add description attribute
#[
#  ["Admin", "People who run the application"],
#  ["Driver", "Operates OTR equipment"]
#].each do |role|
#  Role.find_or_create_by( :name=>role[0], :description=>role[1])
#end

#
# Certificate(s)
#
[
  [ "Birth Certificate",                  # name
    "Birth Certificate original or what?",# description
    true,                                 # for_person
    false,                                # for company
    false,                                # for equipment
    false,                                # for location
    true                                  # active
  ]
].each do |certificate|
  Certificate.find_or_create_by( :name => certificate[0], :description => certificate[1], :for_person => certificate[2], :for_company => certificate[3], 
    :for_equipment => certificate[4], :for_location => certificate[5], :active => certificate[6] ) 
end 
=end

puts "--sow_all Done"