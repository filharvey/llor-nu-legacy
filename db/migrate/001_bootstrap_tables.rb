class BootstrapTables < ActiveRecord::Migration
  def self.up
    create_table "accounts", :force => true do |t|
      t.column "balance",          :integer,  :limit => 50
      t.column "created_on",       :datetime
      t.column "updated_on",       :datetime
      t.column "banked",           :integer
      t.column "user_id",          :integer,  :limit => 50, :default => 0, :null => false
      t.column "user_instance_id", :integer
    end

    add_index "accounts", ["user_id"], :name => "user_id"

    create_table "deeds", :force => true do |t|
      t.column "property_type_id", :integer,  :limit => 50
      t.column "user_id",          :integer,  :limit => 50
      t.column "created_on",       :datetime
      t.column "updated_on",       :datetime
      t.column "square_id",        :integer,  :limit => 50
      t.column "levels",           :integer,  :limit => 50
      t.column "health",           :integer,  :limit => 50, :default => 14, :null => false
      t.column "name",             :string,   :limit => 50
      t.column "landed_on",        :integer,  :limit => 50, :default => 0
      t.column "position",         :integer
      t.column "instance_id",      :integer
    end

    add_index "deeds", ["property_type_id"], :name => "property_type_id"
    add_index "deeds", ["square_id"], :name => "square_id"
    add_index "deeds", ["user_id"], :name => "user_id"

    create_table "event_types", :force => true do |t|
      t.column "event",       :string,   :limit => 50
      t.column "description", :string,   :limit => 50
      t.column "created_on",  :datetime
      t.column "updated_on",  :datetime
    end

    create_table "events", :force => true do |t|
      t.column "user_id",          :integer,  :limit => 50
      t.column "event_type_id",    :integer,  :limit => 50
      t.column "created_on",       :datetime
      t.column "updated_on",       :datetime
      t.column "instance_id",      :integer
      t.column "user_instance_id", :integer
    end

    add_index "events", ["user_id"], :name => "user_id"

    create_table "god_messages", :force => true do |t|
      t.column "message",     :text
      t.column "instance_id", :integer
      t.column "created_on",  :datetime
      t.column "updated_on",  :datetime
    end

    create_table "instance_users", :id => false, :force => true do |t|
      t.column "user_id",     :integer
      t.column "instance_id", :integer
      t.column "created_on",  :datetime
      t.column "updated_on",  :datetime
    end

    create_table "instances", :force => true do |t|
      t.column "name",        :string,   :limit => 100
      t.column "user_id",     :integer
      t.column "created_on",  :datetime
      t.column "updated_on",  :datetime
      t.column "description", :text
    end

    create_table "items", :force => true do |t|
      t.column "description", :string
      t.column "created_on",  :datetime
      t.column "updated_on",  :datetime
    end

    create_table "messages",  :force => true do |t|
      t.column "user_id",     :integer,  :limit => 50, :default => 0, :null => false
      t.column "square_id",   :integer,  :limit => 50
      t.column "message",     :text
      t.column "created_on",  :datetime
      t.column "updated_on",  :datetime
      t.column "instance_id", :integer
    end

    create_table "payments", :force => true do |t|
      t.column "amount",     :integer,  :limit => 50, :default => 0, :null => false
      t.column "user_id",    :integer,  :limit => 50
      t.column "event_id",   :integer,  :limit => 50
      t.column "deed_id",    :integer,  :limit => 50
      t.column "created_on", :datetime
      t.column "updated_on", :datetime
    end

    create_table "property_types", :force => true do |t|
      t.column "title",          :string,   :limit => 50
      t.column "description",    :string
      t.column "base_price",     :integer,  :limit => 50, :default => 0, :null => false
      t.column "min_level",      :integer,  :limit => 50, :default => 0, :null => false
      t.column "created_on",     :datetime
      t.column "updated_on",     :datetime
      t.column "base_rent",      :integer,  :limit => 50
      t.column "max_levels",     :integer,  :limit => 50
      t.column "level_cost",     :integer,  :limit => 50
      t.column "level_modifier", :integer,  :limit => 50
      t.column "position",       :integer,  :limit => 50
    end

    create_table "scores", :force => true do |t|
      t.column "user_id",     :integer,  :limit => 50, :default => 0, :null => false
      t.column "cash",        :integer,  :limit => 50
      t.column "real_estate", :integer,  :limit => 50
      t.column "buildings",   :integer,  :limit => 50
      t.column "created_on",  :datetime
      t.column "updated_on",  :datetime
      t.column "instance_id", :integer
    end

    create_table "sessions", :force => true do |t|
      t.column "session_id", :string
      t.column "data",       :text
      t.column "updated_at", :datetime
    end

    add_index "sessions", ["session_id"], :name => "sessions_session_id_index"

    create_table "settings", :force => true do |t|
      t.column "variable",     :string,  :limit => 100
      t.column "value",       :text
      t.column "instance_id", :integer
      t.column "created_on",  :datetime
      t.column "updated_on",  :datetime
    end

    create_table "square_types", :force => true do |t|
      t.column "description", :string,   :limit => 100
      t.column "for_sale",    :boolean,                 :default => false
      t.column "created_on",  :datetime
      t.column "updated_on",  :datetime
    end

    create_table "squares", :force => true do |t|
      t.column "square_type_id", :integer,  :limit => 50
      t.column "position",       :integer,  :limit => 50
      t.column "created_on",     :datetime
      t.column "updated_on",     :datetime
      t.column "deeds_count",    :integer
      t.column "locked_by_id",  :integer
      t.column "locked_at",      :datetime
      t.column "messages_count", :integer
      t.column "instance_id",    :integer
    end

    add_index "squares", ["position"], :name => "position"

    create_table "user_instances", :force => true do |t|
      t.column "user_id",     :integer
      t.column "instance_id", :integer
      t.column "square_id",   :integer
      t.column "active",      :integer
      t.column "locked_at",   :datetime
      t.column "deeds_count", :integer
    end

    create_table "user_items", :force => true do |t|
      t.column "user_id",          :integer,  :limit => 50
      t.column "item_id",          :string,   :limit => 50
      t.column "uses_left",        :integer,  :limit => 50
      t.column "active",           :integer,  :limit => 2,  :default => 0, :null => false
      t.column "created_on",       :datetime
      t.column "updated_on",       :datetime
      t.column "user_instance_id", :integer
      t.column "apply_mode",       :integer
    end

    add_index "user_items", ["id"], :name => "id"

    create_table "users", :force => true do |t|
      t.column "login",           :string,   :limit => 80, :default => "", :null => false
      t.column "salted_password", :string,   :limit => 40, :default => "", :null => false
      t.column "email",           :string,   :limit => 60, :default => "", :null => false
      t.column "name",            :string,   :limit => 50
      t.column "square_id",       :integer,  :limit => 50, :default => 1,  :null => false
      t.column "created_on",      :datetime
      t.column "updated_on",      :datetime
      t.column "test",            :string,   :limit => 50
      t.column "turns",           :integer,  :limit => 50, :default => 20, :null => false
      t.column "firstname",       :string,   :limit => 40
      t.column "lastname",        :string,   :limit => 40
      t.column "salt",            :string,   :limit => 40
      t.column "verified",        :integer,  :limit => 50, :default => 0
      t.column "role",            :string,   :limit => 40
      t.column "security_token",  :string,   :limit => 40
      t.column "token_expiry",    :datetime
      t.column "logged_in_at",    :datetime
      t.column "created_at",      :datetime
      t.column "updated_at",      :datetime
      t.column "deleted",         :integer,  :limit => 50, :default => 0
      t.column "delete_after",    :datetime
      t.column "instance_id",     :integer
    end

    create_table "waiters", :force => true do |t|
      t.column "email",      :string,   :limit => 200
      t.column "created_on", :datetime
    end
  end

  def self.down
    drop_table "waiters"
    drop_table "users"

    remove_index "user_items", :name => "id"
    drop_table "user_items"

    drop_table "user_instances"

    remove_index "squares", :name => "position"
    drop_table "squares"
    drop_table "square_types"
    drop_table "square_locks"
    drop_table "settings"

    remove_index "sessions", :name => "sessions_session_id_index"
    drop_table "sessions"
    drop_table "scores"
    drop_table "property_types"
    drop_table "payments"
    drop_table "messages"
    drop_table "items"
    drop_table "instances"
    drop_table "instance_users"
    drop_table "god_messages"

    remove_index "events", :name => "user_id"
    drop_table "events"
    drop_table "event_types"

    remove_index "deeds", :name => "square_id"
    remove_index "deeds", :name => "property_type_id"
    drop_table "deeds"

    remove_index "accounts", :name => "user_id"
    drop_table "accounts"
  end
end
