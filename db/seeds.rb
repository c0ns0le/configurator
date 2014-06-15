# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


root_org = Organization.create(name: 'Dunder Mifflin' , office_type: 'head office' , city: 'scranton', state: 'pa', parent_id: nil)
branch_1 = Organization.create(name: 'Dunder Mifflin' , office_type: 'branch office' , city: 'new york', state: 'ny', parent_id: root_org.id)
Organization.create(name: 'Dunder Mifflin' , office_type: 'branch office' , city: 'arkon', state: 'oh', parent_id: root_org.id)
Organization.create(name: 'Dunder Mifflin' , office_type: 'branch office' , city: 'nashua', state: 'nh', parent_id: root_org.id)
Organization.create(name: 'Dunder Mifflin' , office_type: 'branch office' , city: 'ultica', state: 'ny', parent_id: branch_1.id)
Organization.create(name: 'Dunder Mifflin' , office_type: 'branch office' , city: 'albany', state: 'ny', parent_id: branch_1.id)


arco = ConfigSet.create(name: 'arco', config_type: 'service')
sbe = ConfigSet.create(name: 'sbe', config_type: 'service')
product = ConfigSet.create(name: 'product', config_type: 'list')

#arco
ConfigSetValue.create(key:'ip_address', value:'127.0.0.1', status:'enabled',   data_type:'string', config_set_id: arco.id, organization_id: nil)
ConfigSetValue.create(key:'port', value:'127.0.0.1', status:'enabled',   data_type:'string', config_set_id: arco.id, organization_id: nil)
ConfigSetValue.create(key:'member_number', value:'27000', status:'enabled',   data_type:'string', config_set_id: arco.id, organization_id: nil)
ConfigSetValue.create(key:'security_code', value:'1111111', status:'enabled',   data_type:'string', config_set_id: arco.id, organization_id: nil)
ConfigSetValue.create(key:'scores', value:'Fico,Vantage', status:'enabled',   data_type:'string', config_set_id: arco.id, organization_id: nil)

#sbe
ConfigSetValue.create(key:'ip_address', value:'127.0.0.1', status:'enabled',   data_type:'string', config_set_id: sbe.id, organization_id: nil)
ConfigSetValue.create(key:'port', value:'127.0.0.1', status:'enabled',   data_type:'string', config_set_id: sbe.id, organization_id: nil)
ConfigSetValue.create(key:'service_code', value:'27000', status:'enabled',   data_type:'string', config_set_id: sbe.id, organization_id: nil)
ConfigSetValue.create(key:'transaction_id', value:'1111111', status:'enabled',   data_type:'string', config_set_id: sbe.id, organization_id: nil)
ConfigSetValue.create(key:'security_code', value:'Fico,Vantage', status:'enabled',   data_type:'string', config_set_id: sbe.id, organization_id: nil)

ConfigSetValue.create(key:'products', value:'paper', status:'enabled',  data_type:'string', config_set_id:product.id, organization_id:nil)
ConfigSetValue.create(key:'products', value:'binders', status:'enabled',  data_type:'string', config_set_id:product.id, organization_id:nil)
ConfigSetValue.create(key:'products', value:'envelopes', status:'enabled',  data_type:'string', config_set_id:product.id, organization_id:nil)
ConfigSetValue.create(key:'products', value:'labels', status:'enabled',  data_type:'string', config_set_id:product.id, organization_id:nil)

ConfigSetValue.create(key:'products', value:'-labels', status:'enabled',  data_type:'string', config_set_id:product.id, organization_id:branch_1.id)
ConfigSetValue.create(key:'products', value:'chocolate', status:'enabled',  data_type:'string', config_set_id:product.id, organization_id:branch_1.id)

ConfigSetValue.create(key:'security_code', value:'overide', status:'enabled',   data_type:'string', config_set_id: sbe.id, organization_id: 2, published_at:Time.now, tag_name:'my_tag')
# users are seeded in seeds/users.seeds.rb
