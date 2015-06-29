require 'spec_helper'

describe User do
  context "after confirmation" do
    subject { create(:user) }

    it "enqueues admin notification" do
      expect(AdminNotificationWorker).to receive(:perform_async).with('user_confirmed', subject.email)
      subject.confirm
    end
  end

  describe "#admin?" do
    context "for regular user" do
      it "returns false" do
        user = create(:user)
        expect(user.admin?).to be(false)
      end
    end

    context "for user with admin role" do
      it "returns true" do
        user = create(:user, roles: ['admin'])
        expect(user.admin?).to be(true)
      end
    end
  end

  describe "#kosynierzy?" do
    context "for regular user" do
      it "returns false" do
        user = create(:user)
        expect(user.kosynierzy?).to be(false)
      end
    end

    context "for user with kosynierzy role" do
      it "returns true" do
        user = create(:user, roles: ['kosynierzy'])
        expect(user.kosynierzy?).to be(true)
      end
    end
  end
end
