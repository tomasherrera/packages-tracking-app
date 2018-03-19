# spring rspec
describe ApplicationController do

  subject { described_class.new  }

  describe "#cities" do
  end

  describe "#fetch_trucks_from_fleet" do
    context "when fleet.present?" do
      before {}

      it "returns render(:json => trucks.to_json)" do
      end
    end

    context "not fleet.present?" do
      before {}

      it "returns render(:json => { :error => 'not-found' }.to_json, :status => 404)" do
      end
    end
  end

end
