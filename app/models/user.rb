class User < ActiveRecord::Base
	attr_accessible :name, :provider, :uid
	has_many :posts, :dependent => :destroy
	has_many :evaluations, class_name: "RSEvaluation", as: :source

	has_reputation :votes, source: {reputation: :votes, of: :posts}, aggregated_by: :sum

	def voted_for?(post)
		# evaluations.exists?(target_type: post.class, target_id: post.id)
		 evaluations.where(target_type: post.class, target_id: post.id).present?
	end

	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
		end
	end
end
