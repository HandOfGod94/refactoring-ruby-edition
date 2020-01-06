RSpec.describe Rental do
  describe ".new" do
    subject { Rental.new(movie, days_rented) }

    context "when values are valid" do
      let(:movie) { "foo" }
      let(:days_rented) { 2 }

      it { is_expected.to be_an_instance_of(Rental) }
    end
  end
end
