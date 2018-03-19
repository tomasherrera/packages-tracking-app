# spring rspec
describe TrucksController do

  subject { described_class.new  }

  describe "#new" do
    it "assigns @truck" do
    end
    it "assigns @selected_fleet" do
    end
    it "assigns @fleets" do
    end
  end

  describe "#create" do
    it "assigns @truck" do
    end

    context "when @truck.save" do
      before {}

      it "returns format.json { render(:show, :status => :created, :location => (@truck)) }" do
      end
    end

    context "not @truck.save" do
      before {}
    end
  end

  describe "#show" do
  end

  describe "#index" do
  end

end
