# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

arco = Service.create(name: "arco")
sbe = Service.create(name: "sbe")
root_org = Organization.create(name: 'Dundar Mifflan' , office_type: 'head office' , city: 'scranton', state: 'pa', organization_id: nil)
branch_1 = Organization.create(name: 'Dundar Mifflan' , office_type: 'branch office' , city: 'new york', state: 'ny', organization_id: root_org.id)
Organization.create(name: 'Dundar Mifflan' , office_type: 'branch office' , city: 'arkon', state: 'oh', organization_id: root_org.id)
Organization.create(name: 'Dundar Mifflan' , office_type: 'branch office' , city: 'nashua', state: 'nh', organization_id: root_org.id)
Organization.create(name: 'Dundar Mifflan' , office_type: 'branch office' , city: 'ultica', state: 'ny', organization_id: branch_1.id)
Organization.create(name: 'Dundar Mifflan' , office_type: 'branch office' , city: 'albany', state: 'ny', organization_id: branch_1.id)
ServiceDefaultValue.create(key:'ip_address', value:'127.0.0.1', status:'enabled', deleted_at: nil, expired_at: nil,  data_type:'string', service_id: arco.id)
ServiceDefaultValue.create(key:'port', value:'127.0.0.1', status:'enabled', deleted_at: nil, expired_at: nil,  data_type:'string', service_id: arco.id)
ServiceDefaultValue.create(key:'member_number', value:'27000', status:'enabled', deleted_at: nil, expired_at: nil,  data_type:'string', service_id: arco.id)
ServiceDefaultValue.create(key:'security_code', value:'1111111', status:'enabled', deleted_at: nil, expired_at: nil,  data_type:'string', service_id: arco.id)
ServiceDefaultValue.create(key:'scores', value:'Fico,Vantage', status:'enabled', deleted_at: nil, expired_at: nil,  data_type:'string', service_id: arco.id)

ServiceDefaultValue.create(key:'ip_address', value:'127.0.0.1', status:'enabled', deleted_at: nil, expired_at: nil,  data_type:'string', service_id: sbe.id)
ServiceDefaultValue.create(key:'port', value:'127.0.0.1', status:'enabled', deleted_at: nil, expired_at: nil,  data_type:'string', service_id: sbe.id)
ServiceDefaultValue.create(key:'service_code', value:'27000', status:'enabled', deleted_at: nil, expired_at: nil,  data_type:'string', service_id: sbe.id)
ServiceDefaultValue.create(key:'transaction_id', value:'1111111', status:'enabled', deleted_at: nil, expired_at: nil,  data_type:'string', service_id: sbe.id)
ServiceDefaultValue.create(key:'security_code', value:'Fico,Vantage', status:'enabled', deleted_at: nil, expired_at: nil,  data_type:'string', service_id: sbe.id)

ModifiedValue.create(key:'security_code', value:'sometihng_else', organization_id:branch_1.id, service_id:sbe.id)


# users are seeded in seeds/users.seeds.rb







