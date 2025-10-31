class User <ApplicationRecord
    before_safe {self.email = email.downcase}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    has_many :articles

    validates :username, presence: true, 
                      uniqueness: { case_sensitive: false }
  
    validates :email, presence: true, 
                      uniqueness: { case_sensitive: false },
                      format: { with: VALID_EMAIL_REGEX }

end