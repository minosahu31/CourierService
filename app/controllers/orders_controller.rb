class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :track_order

  def index
    @orders = Order.all.includes(:sender, :receiver, :user)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
      #Creating the sender details
      @sender_details = CustomerDetails.new(:name => params[:s_name], :phone => params[:s_phone], :address => params[:s_address], :pincode => params[:s_pincode], :email => params[:s_email])      
      
      #Creating the receiver details
      @receiver_details = CustomerDetails.new(:name => params[:r_name], :phone => params[:r_phone], :address => params[:r_address], :pincode => params[:r_pincode],  :email => params[:r_email])

      # Creating order
      if @sender_details.save! && @receiver_details.save!
        params[:order][:sender_id] = @sender_details.id if @sender_details.present?
        params[:order][:receiver_id] = @receiver_details.id if @receiver_details.present?
        params[:order][:uniq_order_id] = rand(10 ** 10)
        params[:order][:user_id] = User.first.id
        @order = Order.new(params.require(:order).permit(:parcel_weight, :payment_mode, :service_type, :cost_of_service, :status, :user_id, :sender_id, :receiver_id, :uniq_order_id))
        if @order.save!    
          AlertsMailer.send_alert(CustomerDetails.find(@order.sender_id), @order).deliver_now! 
          AlertsMailer.send_alert(CustomerDetails.find(@order.receiver_id), @order).deliver_now! 
          redirect_to orders_path, :notice => "Order was successfully created."
        else
          redirect_to new_order_path, :alert => "Something went wrong! Please try again"
        end
      else
        redirect_to new_order_path, :alert => "Something went wrong! Please try again"
      end  
  end

  def edit
    @order = Order.find(params[:id])
    @sender = @order.sender
    @receiver = @order.receiver
  end

  def update
    @order = Order.find(params[:id])
    #Updating the sender details
    @order.sender.update(:name => params[:s_name], :phone => params[:s_phone], :address => params[:s_address], :pincode => params[:s_pincode], :email => params[:s_email])
    
    #Updating the receiver details
    @order.receiver.update(:name => params[:r_name], :phone => params[:r_phone], :address => params[:r_address], :pincode => params[:r_pincode], :email => params[:r_email])

    # Updating order 
    if @order.update(params.require(:order).permit(:parcel_weight, :payment_mode, :service_type, :cost_of_service, :status))
      redirect_to orders_path, :notice => "Order was successfully updated."
    else
      redirect_to new_order_path, :alert => "Something went wrong! Please try again"
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy

      redirect_to orders_path, :notice => "Order was successfully deleted."
    else
      redirect_to orders_path, :alert => "Something went wrong! Please try again"
    end
  end

  def track_order
    @uniq_order_id = params[:order][:uniq_order_id]  
    @order = Order.find_by_uniq_order_id(@uniq_order_id) if @uniq_order_id.present? 
  end    

  def search_order_status
    @order = Order.new
  end
end
