# spring rspec
describe FleetsController do

  subject { described_class.new  }

  describe "#index" do
    it "assigns @fleets" do
    end
  end

  describe "#show" do
  end

  describe "#new" do
    it "assigns @fleet" do
    end
  end

  describe "#create" do
    it "assigns @fleet" do
    end

    context "when @fleet.save" do
      before {}

      it "returns format.json { render(:show, :status => :created, :location => (@fleet)) }" do
      end
    end

    context "not @fleet.save" do
      before {}
    end
  end

end
