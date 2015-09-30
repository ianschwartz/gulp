class Trail < ActiveRecord::Base
  default_scope { order("start DESC") }
  scope :upcoming, -> { where('start >= ?', Date.today).order(:start) }

  validates :name, presence: true

  has_many :checks, dependent: :destroy
  has_many :locations, through: :checks
  has_many :comments, as: :commentable


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

  def starttime
    start.strftime("%H:%M%p HST")
  end

  def prelube
    checks.where(checktype: 'Prelube').first
  end
end
