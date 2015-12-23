class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic
	validate :text_required

	has_many :comments, :dependent => :delete_all
	accepts_nested_attributes_for :comments

  def coment
    super
  end

	def get_replies_count
		quantity =  self.comments.count - 1
		if quantity < 0
			return 0
		end
		quantity
	end

	private
  def text_required
    if name == ""
      errors[:base] << "Name can't be blank"
    end
  end

end
