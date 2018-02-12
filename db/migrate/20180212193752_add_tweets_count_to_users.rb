class AddTweetsCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tweets_count, :integer, default: 0
  end

end
# User.find_each { |user| User.reset_counters(user.id, :tweets) }
