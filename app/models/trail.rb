class Trail < ActiveRecord::Base
  default_scope {order("start DESC")}

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
    if startdate < Time.now.strftime("%B %d, %Y")
      false
    else
      true
    end
  end

  def startdate
    start.strftime("%B %d, %Y")
  end

  def prelube
    checks.where(checktype: 'Prelube')
  end
end
