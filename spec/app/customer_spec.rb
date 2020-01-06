RSpec.describe Customer do
  describe ".new" do
    subject { Customer.new(name) }

    context "when name is provided" do
      let(:name) { "fizzbuzz" }

      it { is_expected.to be_an_instance_of(Customer) }
    end
  end

  describe ".statement" do
    subject { customer.statement }
    let(:name) { "foo" }

    context "when there are no rentals" do
      let(:customer) { Customer.new(name) }

      it { is_expected.to eq("Rental Record for #{name}\nAmount owed is 0\nYou earned 0 frequent renter points") }
    end

    context "when rental is for REGULAR movie" do
      let(:customer) { Customer.new(name) }
      let(:movie) { Movie.new("MIB", Movie::REGULAR) }
      let(:rental) { Rental.new(movie, 2) }

      it "returns correct result value for REGULAR movie" do
        customer.add_rental(rental)
        expect(subject).to eq("Rental Record for foo\n\tMIB\t2\nAmount owed is 2\nYou earned 1 frequent renter points")
      end
    end

    context "when rental is for NEW_RELEASE" do
      let(:customer) { Customer.new(name) }
      let(:movie) { Movie.new("MIB", Movie::NEW_RELEASE) }
      let(:rental) { Rental.new(movie, 4) }

      it "returns correct result value for NEW_RELEASE movie" do
        customer.add_rental(rental)
        expect(subject).to eq("Rental Record for foo\n\tMIB\t12\nAmount owed is 12\nYou earned 2 frequent renter points")
      end
    end

    context "when rental is for CHILDRENS movie" do
      let(:customer) { Customer.new(name) }
      let(:movie) { Movie.new("MIB", Movie::CHILDRENS) }
      let(:rental) { Rental.new(movie, 3) }

      it "returns correct result value for CHILDRENS movie" do
        customer.add_rental(rental)
        expect(subject).to eq("Rental Record for foo\n\tMIB\t1.5\nAmount owed is 1.5\nYou earned 1 frequent renter points")
      end
    end
  end
end
