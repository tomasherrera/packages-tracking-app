# spring rspec
RSpec.describe PackagesController do

  subject { described_class.new  }

  describe "#index" do
    it "assigns @packages" do
    end

    context "when filtering_params[:status].present?" do
      before {}

      it "assigns @packages = @packages.status(filtering_params[:status])" do
      end
    end

    context "not filtering_params[:status].present?" do
      before {}
    end
  end

  describe "#new" do
    it "assigns @package" do
    end
  end

  describe "#create" do
    it "assigns @package" do
    end

    context "when @package.save" do
      before {}

      it "returns format.json { render(:show, :status => :created, :location => (@package)) }" do
      end
    end

    context "not @package.save" do
      before {}
    end
  end

  describe "#edit" do
  end

  describe "#show" do
  end

  describe "#update" do
    context "when @package.update(package_params)" do
      before {}

      it "returns format.json { render(:show, :status => :ok, :location => (@package)) }" do
      end
    end

    context "not @package.update(package_params)" do
      before {}
    end
  end

  describe "#destroy" do
  end

end
