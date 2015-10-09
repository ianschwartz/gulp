class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates_uniqueness_of :name

  has_many :trails
  has_many :posts, as: :poster
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "user_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   as: :followable,
                                   dependent: :destroy
  has_many :followed_users, through: :active_relationships, 
                            source: :followable, 
                            source_type: 'User'
  has_many :followed_trails, through: :active_relationships, 
                            source: :followable, 
                            source_type: 'Trail'
  has_many :followed_kennels, through: :active_relationships, 
                            source: :followable, 
                            source_type: 'Kennel'
  has_many :followers, through: :passive_relationships,
                       source: :user,
                       foreign_key: :user_id
  has_many :followers, through: :passive_relationships,
                       source: :user,
                       foreign_key: :user_id
  has_many :verifications
  has_many :verifiers, through: :verifications, source: :verifier

  def feed
    posts
  end

  def dashboard
    Post.where("poster_id IN (?) OR poster_id = ?", followed_user_ids, id)
  end

  def upcoming_trails
    (Trail.upcoming.where("kennel_id IN (?) or kennel_id = ?", followed_kennel_ids, id)).order('start ')
  end

  # Follows a user.
  def follow(followable)
    active_relationships.create(followable: followable)
  end

  def following
    followed_users + followed_kennels
  end

  # Unfollows a user.
  def unfollow(followable)
    active_relationships.find_by(followable_id: followable.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(followable)
    following.include?(followable)
  end

  def coming_on_trail?(followable)
    followed_trails.include?(followable)
  end

  def has_trails?
    trails.any?
  end

  def verified?
    verifications.count >= 3
  end
end
