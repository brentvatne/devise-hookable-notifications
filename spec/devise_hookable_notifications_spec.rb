require 'spec_helper'
require 'devise'

describe Devise::Models::HookableNotification do
  before do
    $devise_mailer = double('devise_mailer').as_null_object

    class User < ActiveRecord::Base
      devise :database_authenticatable, :hookable_notifications

      def devise_mailer; $devise_mailer; end

      after_devise_notification :something, perform: ->(user) { user.after_callback }
    end
  end

  let(:user) { User.new }

  it 'allows you to define actions to perform after certain events' do
    allow(user).to receive(:after_callback).once
    user.send_devise_notification(:something)
  end
end
