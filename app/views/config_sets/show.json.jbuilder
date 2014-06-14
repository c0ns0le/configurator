json.extract! @config_set, :id, :name, :config_type, :deleted_at, :expired_at, :created_at, :updated_at
json.default_values @config_set.default_values
 json.releases tags: [
    {
      tag_name: 'foo', 
      config_sets: [
        {
          name:'arco', 
          tag_name:'foo',
          config_set_values: [
            {
              id: 1,
              key: "ip_address",
              value: "127.0.0.1",
              status: "enabled",
              data_type: "string",
              config_set_id: 1,
              organization_id: nil,
              deleted_at: nil,
              expired_at: nil,
              created_at: "2014-06-14T17:38:07.640Z",
              updated_at: "2014-06-14T17:38:07.640Z"
            }, {
              id: 4,
              key: "security_code",
              value: "1111111",
              status: "enabled",
              data_type: "string",
              config_set_id: 1,
              organization_id: nil,
              deleted_at: nil,
              expired_at: nil,
              created_at: "2014-06-14T17:38:07.675Z",
              updated_at: "2014-06-14T17:38:07.675Z"
              }
          ]
        }
      ],
      orgs: [
        {
          id: 1,
          name: "Dundar Mifflan",
          office_type: "head office",
          city: "scranton",
          state: "pa",
          parent_id: nil,
          config_set_values: [
            {
              id: 1,
              key: "ip_address",
              value: "127.0.0.1",
              status: "enabled",
              data_type: "string",
              config_set_id: 1,
              organization_id: nil,
              deleted_at: nil,
              expired_at: nil,
              created_at: "2014-06-14T17:38:07.640Z",
              updated_at: "2014-06-14T17:38:07.640Z"
            }
          ]
          },
        {
          id: 2,
          name: "Dundar Mifflan",
          office_type: "branch office",
          city: "new york",
          state: "ny",
          parent_id: 1,
          config_set_values: [
            {
              id: 1,
              key: "ip_address",
              value: "127.0.0.1",
              status: "enabled",
              data_type: "string",
              config_set_id: 1,
              organization_id: nil,
              deleted_at: nil,
              expired_at: nil,
              created_at: "2014-06-14T17:38:07.640Z",
              updated_at: "2014-06-14T17:38:07.640Z"
            }
          ]
          }
      ]

    }
  ]