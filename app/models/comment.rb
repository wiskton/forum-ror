class Comment < ActiveRecord::Base
  validate :text_required
  belongs_to :user

	belongs_to :post


  private
  def text_required
    if content == ""
      errors[:base] << "Text can't be blank"
    end
  end
end
