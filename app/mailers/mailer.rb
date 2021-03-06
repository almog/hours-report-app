class Mailer < ActionMailer::Base

  def invitation_email(invitation)

    @invitation = invitation

    mail(
      to: @invitation.recipient_named_email,
      subject: "Welcome to Hours Report"
    )
  end

  def reminder_email(user_id, report_id)

    @user = User.find(user_id)
    @report = Report.find(report_id)
    @timesheet = @report.timesheets.find_by_user_id(user_id)

    mail(
      to: @user.email,
      subject: "Please fill your Hours Report"
    )
  end
end
