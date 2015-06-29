require 'spec_helper'

describe AdminNotificationWorker do
  subject { described_class.new }

  describe ".perform" do
    let(:notification_type) { "notification" }
    let(:email) { "example@example.com" }

    it "delegates email to mailer" do
      expect(AdminNotificationMailer).to receive(notification_type).with(email).and_return(double(deliver_now: nil))
      subject.perform(notification_type, email)
    end

    context "user confirmed" do
      before { create(:user, email: email) }

      let(:notification_type) { "user_confirmed" }

      it "sends email" do
        expect do
          subject.perform(notification_type, email)
        end.to change { ActionMailer::Base.deliveries.size }.by(1)
      end
    end
  end
end
