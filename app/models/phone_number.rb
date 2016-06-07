class PhoneNumber < ApplicationRecord
  belongs_to :user
  # validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }

  def generate_pin
    self.pin = rand(0000..9999).to_s.rjust(4, "0")
    save
  end

  def twilio_client
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_pin
    twilio_client.messages.create(
    to: phone_number,
    from: ENV['TWILIO_PHONE_NUMBER'],
    body: "Your PIN is #{pin}"
    )
  end

  def verify(entered_pin)
    update(verified: true) if self.pin == entered_pin
  end

end

# test.messages.create(to: '2153845679',from: '2038262966',body: "Your PIN is 1234")