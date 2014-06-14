require 'test_helper'

class ConfigSetValueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "key override" do
    csval = config_set_values(:host_override)
    values = csval.organization.values_for(csval.config_set)
    assert values[:host] != config_set_values(:host_default).value
  end

  test "default key rollback" do
    nk = ConfigSetValue.create(key:'new_key', value:'new_value', status:ConfigSetValue::STATUS_PENDING_ADD, deleted_at: nil, expired_at: nil,  data_type:'string', config_set_id: config_sets(:arco).id, organization_id: nil)
    assert ConfigSetValue.find(nk.id)
    nk.publish('my_tag')
    nk.rollback
    nk.reload
    assert nk.status == ConfigSetValue::STATUS_DELETED
  end
  
  test "delete override" do 
    csval = config_set_values(:host_override)
    csval.remove_config_set_key
    assert csval.status == ConfigSetValue::STATUS_PENDING_DELETE  
    csval.publish('tag_name')
    csval.reload
    assert csval.status == ConfigSetValue::STATUS_DELETED
    assert_not csval.deleted_at.nil?
    assert csval.expired_at < Time.now + 1.days
  end   
  
   test "remove default key" do
    csval = config_set_values(:host_default)
     puts csval.config_set.default_values
     puts ConfigSetValue.all.map &:to_yaml
    csval.remove_config_set_key
    assert csval.status == ConfigSetValue::STATUS_PENDING_DELETE  
    csval.publish('tag_name')
    csval.reload
     assert csval.status == ConfigSetValue::STATUS_DELETED
    assert_not csval.deleted_at.nil?
    assert csval.expired_at > Time.now + 1.days
     
     puts csval.config_set.default_values
    # when a defult key is removed, it should warn..
     assert csval.config_set.default_values[csval.key]
     assert csval.config_set.default_values['warning']
  end
  
end
