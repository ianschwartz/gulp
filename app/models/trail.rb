class Trail < ActiveRecord::Base
  scope :upcoming, -> { where('start >= ?', Date.today).order('start ASC') }
  scope :calendar, -> { where('start >= ?', Date.today).order(start: :asc) }

  validates :name, presence: true

  has_many :checks, dependent: :destroy
  has_many :locations, through: :checks
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   as: :followable,
                                   dependent: :destroy
  has_many :followers, through: :passive_relationships,
                       source: :user,
                       foreign_key: :user_id

  belongs_to :user
  belongs_to :kennel

  def creator
    user.name
  end

  def permissions(u)
    user == u
  end

  def over
    startdate < Time.now.strftime("%B %d, %Y")
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

  def nearby
    if goodchecks.any?
      last_check.nearby
    else
      kennel.nearby
    end
  end
end
