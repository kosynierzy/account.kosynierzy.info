require "spec_helper"

describe AdminNotificationMailer do
  describe "#user_confirmed" do
    before do
      create(:user, email: email)
    end

    let(:email) { "user@example.com" }
    let(:mail) { described_class.user_confirmed(email) }

    it { expect(mail.subject).to eq('[Kosynierzy] New account created') }
  end
end
