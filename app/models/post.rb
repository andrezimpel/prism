class Post < ActiveRecord::Base

  # order
  default_scope { order('published_at DESC', 'updated_at DESC') }

  # tags
  acts_as_taggable

  # association
  belongs_to :gallery

  # generate permalink
  before_save :generate_perma
  def generate_perma
    self.permalink = self.title.parameterize
  end

  # dates
  def year
    return self.created_at.strftime("%Y")
  end
  def month
    return self.created_at.strftime("%m")
  end
  def day
    return self.created_at.strftime("%d")
  end
end
