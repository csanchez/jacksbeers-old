class Shoppe::User < ActiveRecord::Base
  authenticates_with_sorcery!
  alias_attribute :email_address, :email

  	validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  	validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  	validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }
	  validates :email, uniqueness: true, email_format: { message: 'has invalid format' }
	#validates :first_name, :presence => true
  #  validates :last_name, :presence => true

  def full_name
       "#{first_name} #{last_name}"
    end
  
     def short_name
       "#{first_name} #{last_name[0,1]}"
     end


end
