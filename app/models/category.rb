class Category < ActiveRecord::Base
  validate :name_required

  has_many :topics

  def tops
    topics.where(topic_id: nil)
  end

  private
  def name_required
    if name == ""
      errors[:base] << "Name can't be blank"
    end
  end

end
