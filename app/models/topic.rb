class Topic < ActiveRecord::Base
	belongs_to :category
  has_many :topics
  has_many :posts

	def all_posts
    if self.topics
			return Post.where('topic_id IN (?) OR id IN (?)', self.topics.map(&:id), self.posts.map(&:id))
		end
		Post.where(id: self.posts.map(&:id))
	end

	def get_topic
		if self.topic_id
			return Topic.find(self.topic_id)
		end
		nil
	end

	def get_views
		self.all_posts.sum(:views)
	end

	def get_comments
		Comment.where(post_id: self.all_posts.map(&:id))
	end

	def last_post
    self.all_posts.order('updated_at').last
	end

end
