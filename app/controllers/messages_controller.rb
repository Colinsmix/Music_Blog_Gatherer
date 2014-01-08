class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      ForwardMessage.send_message(@message).deliver
      redirect_to root_path, notice: 'Message Created Successfully'
    else
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:email,:subject,:description,:first_name,:last_name)
  end
end