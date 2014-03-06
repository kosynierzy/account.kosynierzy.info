require 'spec_helper'

describe User do
  context "after confirmation" do
    subject { create(:user) }

    it "enqueues admin notification" do
      expect(Backburner).to receive(:enqueue).with(AdminNotificationWorker, 'user_confirmed', subject.email)
      subject.confirm!
    end
  end
end
