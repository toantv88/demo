class User < ActiveRecord::Base
  attr_accessor :remember_token
	before_save {email.downcase! }
  validates :name, :presence =>  true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX }  
  validates_uniqueness_of :email, :allow_blank => true                
  has_secure_password
  

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
 #  def self.install(username,password)
	# 	if  username and password
	# 	create(:name =>"#{username}", :password => "#{password}")	
	# 	end
	# end
	def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

 
 end
