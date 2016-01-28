# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# encoding: UTF-8
Shoppe::User.create(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :first_name => 'Default', :last_name => 'Admin')
# tax rates
tax_rate = Shoppe::TaxRate.create!(:name => "IVA", :rate => 16.0)


# delivery services

#ds = Shoppe::DeliveryService.create!(:name => "Next Day Delivery", :code => 'ND16', :courier => 'AnyCourier', :tracking_url => 'http://trackingurl.com/track/{{consignment_number}}')
#ds.delivery_service_prices.create!(:code => 'Parcel', :min_weight => 0, :max_weight => 1, :price => 5.0, :cost_price => 4.50, :tax_rate => tax_rate)
#ds.delivery_service_prices.create!(:code => 'Parcel', :min_weight => 1, :max_weight => 5, :price => 8.0, :cost_price => 7.5, :tax_rate => tax_rate)
#ds.delivery_service_prices.create!(:code => 'Parcel', :min_weight => 5, :max_weight => 20, :price => 10.0, :cost_price => 9.50, :tax_rate => tax_rate)

#ds = Shoppe::DeliveryService.create!(:name => "Saturday Delivery", :code => 'NDSA16', :courier => 'AnyCourier', :tracking_url => 'http://trackingurl.com/track/{{consignment_number}}')
#ds.delivery_service_prices.create!(:code => 'Parcel', :min_weight => 0, :max_weight => 1, :price => 27.0, :cost_price => 24.00, :tax_rate => tax_rate)
#ds.delivery_service_prices.create!(:code => 'Parcel', :min_weight => 1, :max_weight => 5, :price => 29.0, :cost_price => 20.00, :tax_rate => tax_rate)
#ds.delivery_service_prices.create!(:code => 'Parcel', :min_weight => 5, :max_weight => 20, :price => 37.0, :cost_price => 32.00,:tax_rate => tax_rate)

ds = Shoppe::DeliveryService.create!(:name => "Just In Time Delivery", :code => 'JITD16', :courier => 'AnyCourier', :tracking_url => 'http://trackingurl.com/track/{{consignment_number}}')
ds.delivery_service_prices.create!(:code => 'Parcel', :min_weight => 0, :max_weight => 100, :price => 27.0, :cost_price => 24.00, :tax_rate => tax_rate)

# categories
#cat1 = Shoppe::ProductCategory.create!(:name => 'VoIP Phones')
#cat2 = Shoppe::ProductCategory.create!(:name => 'VoIP Accessories')
#cat3 = Shoppe::ProductCategory.create!(:name => 'Network Eqipment')
cat1 = Shoppe::ProductCategory.create!(:name => 'Beers',permalink:"beers")

def get_file(name, content_type = 'image/png')
  file = ActionDispatch::Http::UploadedFile.new(:tempfile => File.open(File.join(Rails.root, 'app/assets/images/', 'beers', name), 'rb'))
  file.original_filename = name
  file.content_type = content_type
  file
end

#lorem = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'


#price es al publico, lo que costo es cost_price
pro = Shoppe::Product.new(:name => Faker::Commerce.product_name , :sku => Faker::Code.isbn, :description => Faker::Lorem.sentence(10), :short_description => Faker::Lorem.sentence(5), :weight => 
Faker::Number.decimal(1, 3), :price => Faker::Commerce.price, :cost_price => Faker::Commerce.price, :tax_rate => tax_rate)
pro.product_category_ids = cat1.id
pro.default_image_file = get_file('beer-1.png')
pro.save!
pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 200)
pro.product_attributes.create!(:key => 'Manufacturer', :value => Faker::Company.name, :position => 1)
pro.product_attributes.create!(:key => 'Color', :value => 'Clara', :position => 1)
pro.product_attributes.create!(:key => 'Marinaje', :value => 'Desconocido', :position => 1,searchable:false)

pro = Shoppe::Product.new(:name => Faker::Commerce.product_name , :sku => Faker::Code.isbn, :description => Faker::Lorem.sentence(10), :short_description => Faker::Lorem.sentence(5), :weight => 
Faker::Number.decimal(1, 3), :price => Faker::Commerce.price, :cost_price => Faker::Commerce.price, :tax_rate => tax_rate)
pro.product_category_ids = cat1.id
pro.default_image_file = get_file('beer-2.png')
pro.save!
pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 200)
pro.product_attributes.create!(:key => 'Manufacturer', :value => Faker::Company.name, :position => 1)
pro.product_attributes.create!(:key => 'Color', :value => 'Clara', :position => 1)
pro.product_attributes.create!(:key => 'Marinaje', :value => 'Desconocido', :position => 1,searchable:false)

pro = Shoppe::Product.new(:name => Faker::Commerce.product_name , :sku => Faker::Code.isbn, :description => Faker::Lorem.sentence(10), :short_description => Faker::Lorem.sentence(5), :weight => 
Faker::Number.decimal(1, 3), :price => Faker::Commerce.price, :cost_price => Faker::Commerce.price, :tax_rate => tax_rate)
pro.product_category_ids = cat1.id
pro.default_image_file = get_file('beer-3.png')
pro.save!
pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 200)
pro.product_attributes.create!(:key => 'Manufacturer', :value => Faker::Company.name, :position => 1)
pro.product_attributes.create!(:key => 'Color', :value => 'Clara', :position => 1)
pro.product_attributes.create!(:key => 'Marinaje', :value => 'Desconocido', :position => 1,searchable:false)

pro = Shoppe::Product.new(:name => Faker::Commerce.product_name , :sku => Faker::Code.isbn, :description => Faker::Lorem.sentence(10), :short_description => Faker::Lorem.sentence(5), :weight => 
Faker::Number.decimal(1, 3), :price => Faker::Commerce.price, :cost_price => Faker::Commerce.price, :tax_rate => tax_rate)
pro.product_category_ids = cat1.id
pro.default_image_file = get_file('beer-4.png')
pro.save!
pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 200)
pro.product_attributes.create!(:key => 'Manufacturer', :value => Faker::Company.name, :position => 1)
pro.product_attributes.create!(:key => 'Color', :value => 'Clara', :position => 1)
pro.product_attributes.create!(:key => 'Marinaje', :value => 'Desconocido', :position => 1,searchable:false)

pro = Shoppe::Product.new(:name => Faker::Commerce.product_name , :sku => Faker::Code.isbn, :description => Faker::Lorem.sentence(10), :short_description => Faker::Lorem.sentence(5), :weight => 
Faker::Number.decimal(1, 3), :price => Faker::Commerce.price, :cost_price => Faker::Commerce.price, :tax_rate => tax_rate)
pro.product_category_ids = cat1.id
pro.default_image_file = get_file('beer-5.png')
pro.save!
pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 200)
pro.product_attributes.create!(:key => 'Manufacturer', :value => Faker::Company.name, :position => 1)
pro.product_attributes.create!(:key => 'Color', :value => 'Oscura', :position => 1)
pro.product_attributes.create!(:key => 'Marinaje', :value => 'Desconocido', :position => 1,searchable:false)

pro = Shoppe::Product.new(:name => Faker::Commerce.product_name , :sku => Faker::Code.isbn, :description => Faker::Lorem.sentence(10), :short_description => Faker::Lorem.sentence(5), :weight => 
Faker::Number.decimal(1, 3), :price => Faker::Commerce.price, :cost_price => Faker::Commerce.price, :tax_rate => tax_rate)
pro.product_category_ids = cat1.id
pro.default_image_file = get_file('beer-6.png')
pro.save!
pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 200)
pro.product_attributes.create!(:key => 'Manufacturer', :value => Faker::Company.name, :position => 1)
pro.product_attributes.create!(:key => 'Color', :value => 'Clara', :position => 1)
pro.product_attributes.create!(:key => 'Marinaje', :value => 'Desconocido', :position => 1,searchable:false)

pro = Shoppe::Product.new(:name => Faker::Commerce.product_name , :sku => Faker::Code.isbn, :description => Faker::Lorem.sentence(10), :short_description => Faker::Lorem.sentence(5), :weight => 
Faker::Number.decimal(1, 3), :price => Faker::Commerce.price, :cost_price => Faker::Commerce.price, :tax_rate => tax_rate)
pro.product_category_ids = cat1.id
pro.default_image_file = get_file('beer-7.png')
pro.save!
pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 200)
pro.product_attributes.create!(:key => 'Manufacturer', :value => Faker::Company.name, :position => 1)
pro.product_attributes.create!(:key => 'Color', :value => 'Clara', :position => 1)
pro.product_attributes.create!(:key => 'Marinaje', :value => 'Desconocido', :position => 1,searchable:false)

pro = Shoppe::Product.new(:name => Faker::Commerce.product_name , :sku => Faker::Code.isbn, :description => Faker::Lorem.sentence(10), :short_description => Faker::Lorem.sentence(5), :weight => 
Faker::Number.decimal(1, 3), :price => Faker::Commerce.price, :cost_price => Faker::Commerce.price, :tax_rate => tax_rate)
pro.product_category_ids = cat1.id
pro.default_image_file = get_file('beer-8.png')
pro.save!
pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 200)
pro.product_attributes.create!(:key => 'Manufacturer', :value => Faker::Company.name, :position => 1)
pro.product_attributes.create!(:key => 'Color', :value => 'Oscura', :position => 1)
pro.product_attributes.create!(:key => 'Marinaje', :value => 'Desconocido', :position => 1,searchable:false)

pro = Shoppe::Product.new(:name => Faker::Commerce.product_name , :sku => Faker::Code.isbn, :description => Faker::Lorem.sentence(10), :short_description => Faker::Lorem.sentence(5), :weight => 
Faker::Number.decimal(1, 3), :price => Faker::Commerce.price, :cost_price => Faker::Commerce.price, :tax_rate => tax_rate)
pro.product_category_ids = cat1.id
pro.default_image_file = get_file('beer-9.png')
pro.save!
pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 200)
pro.product_attributes.create!(:key => 'Manufacturer', :value => Faker::Company.name, :position => 1)
pro.product_attributes.create!(:key => 'Color', :value => 'Oscura', :position => 1)
pro.product_attributes.create!(:key => 'Marinaje', :value => 'Desconocido', :position => 1,searchable:false)

pro = Shoppe::Product.new(:name => Faker::Commerce.product_name , :sku => Faker::Code.isbn, :description => Faker::Lorem.sentence(10), :short_description => Faker::Lorem.sentence(5), :weight => 
Faker::Number.decimal(1, 3), :price => Faker::Commerce.price, :cost_price => Faker::Commerce.price, :tax_rate => tax_rate)
pro.product_category_ids = cat1.id
pro.default_image_file = get_file('beer-10.png')
pro.save!
pro.stock_level_adjustments.create(:description => 'Initial Stock', :adjustment => 200)
pro.product_attributes.create!(:key => 'Manufacturer', :value => Faker::Company.name, :position => 1)
pro.product_attributes.create!(:key => 'Color', :value => 'Oscura', :position => 1)
pro.product_attributes.create!(:key => 'Marinaje', :value => 'Desconocido', :position => 1,searchable:false)



