class User < ActiveRecord::Base
  validates :username, uniqueness: true
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

   has_many :friends, through: :active_relationships

   def find_friends
    this.friends
    end                             
end
