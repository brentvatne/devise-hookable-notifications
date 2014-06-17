ActiveRecord::Schema.define(:version => 1) do
  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password",            :limit => 40
    t.string   "salt",                        :limit => 40
  end
end
