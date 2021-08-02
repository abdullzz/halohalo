class User < ApplicationRecord
    has_secure_password
    # cattr_reader :password

    # validates :password, :presence => true, :confirmation =>true
    # validates_confirmation_of :password_confirmation

    # def update_with_password(user_params)
    #     current_password = user_params.delete(:password)
    #     if self.authenticate(current_password)
    #         self.update(user_params)
    #     else
    #         self.errors.add(:password, current_password.blank? ? :blank : :invalid)
    #     end
    # end
end
