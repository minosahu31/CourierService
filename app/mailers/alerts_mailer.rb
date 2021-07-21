class AlertsMailer < ApplicationMailer
  default from: "ordersystem45@gmail.com"

  def send_alert(customer, order)
    @order = order
    @customer = customer
    mail(:to => customer.email, :subject => "Your order #{@order.status}")
  end
end
