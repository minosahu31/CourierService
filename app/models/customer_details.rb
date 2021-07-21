class CustomerDetails < ApplicationRecord
    has_one :order
    validates :name, :pincode, :address, :phone, :email, :presence => true
    validates :phone, :presence => { :message => "Only positive number without spaces are allowed!" },
                    :numericality => true,
                    :length => { :minimum => 10, :maximum => 15 }
    validates :email, format: { with: /\A(.+)@(.+)\z/, message: "Email invalid"  },
                              length: { minimum: 4, maximum: 254 }
    validates :pincode, format: { with: /\A[1-9][0-9]{5}\z/, message: "Pincode invalid"  },
                              length: { minimum: 6, maximum: 6 }                                              
end
