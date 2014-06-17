require 'active_support/concern'

module Devise
  module Models
    module HookableNotification
      extend ActiveSupport::Concern

      included do
        def send_devise_notification(notification, *args)
          super.tap do |_|
            cbs = self.class.instance_variable_get('@_after_devise_notification_callbacks')

            if cbs.present? && cbs[notification].present?
              cbs[notification].each { |cb| cb.call(self) }
            end
          end
        end
      end

      module ClassMethods
        def after_devise_notification(notification, options = {})
          @_after_devise_notification_callbacks ||= {}
          if options[:perform].present?
            @_after_devise_notification_callbacks[notification] ||= []
            @_after_devise_notification_callbacks[notification] << options[:perform]
          end
        end
      end
    end
  end
end
