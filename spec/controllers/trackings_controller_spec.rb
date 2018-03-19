# spring rspec
describe TrackingsController do

  subject { described_class.new  }

  describe "#index" do
  end

  describe "#lookup" do
    it "assigns @package" do
    end

    context "when @package.present?" do
      before {}

      it "returns format.json { render(:json => (@package)) }" do
      end
    end

    context "not @package.present?" do
      before {}
    end
  end

end
