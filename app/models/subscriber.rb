class Subscriber < ApplicationRecord
	before_save :mailchimp
  validates :name, presence: true, length: { minimum: 3, maximum: 32 }, uniqueness: {case_sensitive: false}
  validates :langage, :pays, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
    presence: true,
    length: {minimum: 3, maximum: 255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
    
  protected
    
    def mailchimp
      mailchimp = Mailchimp::API.new("700f335bc25c5e108530e86d769e1510-us20")
      mailchimp.lists.subscribe("2338524647",
                               { email: self.email },
                               { 'NAME' => self.name, 'LANGAGE' => self.langage, 'PAYS' => self.pays })
    end 
end
