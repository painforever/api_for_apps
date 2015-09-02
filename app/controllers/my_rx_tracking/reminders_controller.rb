class MyRxTracking::RemindersController < ApplicationController
  def create
    reminder = Reminder.new(reminder_params)
    render_when_save(reminder)
  end

  def index
    reminders = Reminder.with_users.where(user_id: params[:user_id])
    list = []
    reminders.each {|r|
      reminder = {reminder_name: r.reminder_name, reminder_time: r.reminder_time.strftime("%H:%M:%S"), drug_name: r.drug_name}
      list.push(reminder)
    }
    render json: list, status: 200
  end


  private
  def reminder_params
    params.require(:reminder).permit!
  end
end
