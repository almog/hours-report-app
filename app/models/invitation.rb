class Invitation < ActiveRecord::Base

  validates_presence_of :recipient, :sender, :employee_number
  validate :recipient_already_registered?, if: "recipient.present?"

  def recipient_named_email
    "#{recipient_name} <#{recipient}>"
  end

  def recipient_name
    recipient.split(/\.|@/)[0..1].map(&:capitalize).join(" ")
  end

  private

  def recipient_already_registered?
    if User.exists?(email: recipient.downcase)
      errors.add(:recipient, "Recipient is registered")
    end
  end

end
