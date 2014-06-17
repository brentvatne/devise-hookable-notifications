# devise-hookable-notifications

Hook email send events, such as `:unlock_instructions`, perhaps to send
another email of your own or whatever you want, without having to mess
around with the actions themselves.

```ruby
  devise :database_authenticatable, :lockable, :hookable_notifications

  after_devise_notification :unlock_instructions, perform: ->(user) {
    AdminMailer.activity_notice(user, 'Account Locked').deliver }
```

### TODO

- [ ] As needed, add support for a `before` callback.
