# Swagger::Docs::Config.register_apis({
#   "1.0" => {
#     # the extension used for the API
#     :api_extension_type => :json,
#     # the output location where your .json files are written to
#     :api_file_path => "public/api/v1/",
#     # the URL base path to your API
#     :base_path => "http://api.somedomain.com",
#     # if you want to delete all .json files at each generation
#     :clean_directory => false
#   }
# })

Swagger::Docs::Config.register_apis({
  "1.0" => {:controller_base_path => "", :api_file_path => "public/api_docs",  :clean_directory => true}
})

class Swagger::Docs::Config
  def self.transform_path(path)
    "api_docs/#{path}"
  end
end

# run with
# rake swagger:docs