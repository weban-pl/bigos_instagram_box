require "bigos_instagram_box/engine"
require "instagram"
require "bigos_settings"

module BigosInstagramBox

  module Controllers
    autoload :Helpers, 'bigos_instagram_box/controllers/helpers'
  end

  def self.setup
    include_helpers
    yield self
  end

  # Include helpers to AC and AV.
  def self.include_helpers
    ActiveSupport.on_load(:action_controller) do
    end

    ActiveSupport.on_load(:action_view) do
      include BigosInstagramBox::Controllers::Helpers
    end
  end

end
