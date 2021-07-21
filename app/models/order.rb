class Order < ApplicationRecord
  belongs_to :user
  belongs_to :sender, class_name: "CustomerDetails", foreign_key: "sender_id",  dependent: :destroy
  belongs_to :receiver, class_name: "CustomerDetails", foreign_key: "receiver_id",  dependent: :destroy
   
  validates :parcel_weight, :cost_of_service, :presence => true
  validates :parcel_weight, :cost_of_service, :presence => { :message => "Only positive number without spaces are allowed!" },
                     :numericality => true
end
