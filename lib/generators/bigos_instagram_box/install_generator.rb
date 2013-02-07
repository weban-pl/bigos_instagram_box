module BigosInstagramBox
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a BigosInstagramBox initializer."
      def copy_initializer
        template "bigos_instagram_box.rb", "config/initializers/bigos_instagram_box.rb"
      end

      def create_settings
        Setting["GS.instagram_client_id"] = "YOUR_APP_ACCESS_TOKEN" if Setting.find_by_var("GS.instagram_client_id").blank?
        Setting["GS.instagram_client_secret"] = "YOUR_APP_CLIENT_SECRET" if Setting.find_by_var("GS.instagram_client_secret").blank?
        Setting["GS.instagram_access_token"]= "YOUR_APP_ACCESS_TOKEN" if Setting.find_by_var("GS.instagram_access_token").blank?
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