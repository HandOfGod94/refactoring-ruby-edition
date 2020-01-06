RSpec.describe Movie do
  describe ".new" do
    subject { Movie.new(title, price_code) }

    context "when title and price code values are valid" do
      let(:title) { "foo" }
      let(:price_code) { "bar" }

      it { is_expected.to be_an_instance_of(Movie) }
    end
  end
end
