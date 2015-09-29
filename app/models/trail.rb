class Trail < ActiveRecord::Base
  validates :name, presence: true

  has_many :checks, dependent: :destroy
  has_many :locations, through: :checks

  belongs_to :user

  def creator
    user.email
  end

  def permissions(u)
    user == u
  end

  def over
    start < (Time.now + (2*7*24*60*60))
  end
end
