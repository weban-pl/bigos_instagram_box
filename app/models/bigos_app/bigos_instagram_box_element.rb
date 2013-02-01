module BigosApp
  class BigosInstagramBoxElement < PageElement

    def self.class_name
      "Instagram module"
    end

    def render
      "bigos_instagram_box/module/item"
    end

    def admin_render
      nil
    end

  end
end