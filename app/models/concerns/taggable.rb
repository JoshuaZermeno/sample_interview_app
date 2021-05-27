module Taggable
  extend ActiveSupport::Concern
  included do
    has_many :tags
    extend ClassMethods
  end

  module ClassMethods
    def taggable_data(attribute)
      define_method "tag_with_#{attribute}" do
        tags.create(tag: attribute)
      end
    end
  end
end
