module BigosInstagramBox
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a BigosInstagramBox initializer."
      def copy_initializer
        template "bigos_instagram_box.rb", "config/initializers/bigos_instagram_box.rb"
      end

      def create_settings
        Setting["#{BigosInstagramBox.name}.client_id"] = "YOUR_APP_ACCESS_TOKEN"
        Setting["#{BigosInstagramBox.name}.client_secret"] = "YOUR_APP_CLIENT_SECRET"
        Setting["#{BigosInstagramBox.name}.access_token"]= "YOUR_APP_ACCESS_TOKEN"
        Setting["#{BigosInstagramBox.name}.hashtag"] = ""
        Setting["#{BigosInstagramBox.name}.user_id"] = ""
        Setting["#{BigosInstagramBox.name}.user_name"] = ""
        Setting["#{BigosInstagramBox.name}.latitude"] = ""
        Setting["#{BigosInstagramBox.name}.longitude"] = ""
        Setting["#{BigosInstagramBox.name}.limit"] = 10
        im = BigosApp::InstalledModule.find_or_create_by_name(BigosInstagramBox.name)
        im.page_element = BigosApp::BigosInstagramBoxElement.name
        im.save
      end


    end
  end
end