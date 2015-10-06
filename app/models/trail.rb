class Trail < ActiveRecord::Base
  scope :upcoming, -> { where('start >= ?', Date.today).order('start DESC') }
  scope :calendar, -> { where('start >= ?', Date.today).order(start: :asc) }

  validates :name, presence: true

  has_many :checks, dependent: :destroy
  has_many :locations, through: :checks
  has_many :comments, as: :commentable, dependent: :destroy

  belongs_to :user
  belongs_to :kennel

  def creator
    user.name
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

  def mappable
    checks.last.mappable
  end

  def goodchecks
    checks[0...-1]
  end

  def last_check
    goodchecks.last.location.place
  end

end
