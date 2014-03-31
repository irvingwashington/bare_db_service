require 'spec_helper'

describe BareDBService::App do

  describe "initialization" do

    it "succeeeds" do
      described_class.new
    end

    it "creates router" do
      expect(subject.router).to be_a(Lotus::Router)
    end

  end

  it "calls" do
    subject.call({})
  end

end
