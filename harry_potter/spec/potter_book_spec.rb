require 'potter_book'

describe 'Selling Harry Potter books' do

  context 'Selling a Single book' do
    let(:book_one) { PotterBook.new([1]) }
    let(:book_four) { PotterBook.new([4]) }

    it 'book 1 costs 8GBP' do
      expect( book_one.sell ).to eq( 8 )
    end

    it 'book 4 costs 8GBP' do
      expect( book_four.sell ).to eq( 8 )
    end
  end

  context 'Selling two books' do
    let(:same_books) { PotterBook.new([1, 1]) }
    let(:different_books) { PotterBook.new([1, 4]) }

    it 'two copies of book 1 costs 16GBP' do
      expect( same_books.sell ).to eq( 16 )
    end

    it 'a copy of book 1 and book 4 costs 15.20GBP' do
      expect( different_books.sell ).to eq( 15.2 )
    end
  end

  context 'Selling three books' do
    let(:same_books) { PotterBook.new([1, 1, 1]) }
    let(:two_and_one_books) { PotterBook.new([1, 1, 4]) }
    let(:different_books) { PotterBook.new([1, 2, 4]) }

    it 'three copies of book 1 costs 24GBP' do
      expect(same_books.sell).to eq(24)
    end

    it 'two copies of book 1 and one copy of book 4 costs 23.20GBP' do
      expect(two_and_one_books.sell).to eq(23.2)
    end

    it 'one copy of three different books should cost 21.60GBP' do
      expect(different_books.sell).to eq(21.6)
    end
  end

  context 'Selling four books' do
    let(:same_books) { PotterBook.new([1, 1, 1, 1]) }
    let(:two_and_two_books) { PotterBook.new([1, 1, 4, 4]) }
    let(:three_and_one_books) { PotterBook.new([1, 1, 1, 4]) }
    let(:different_books) { PotterBook.new([1, 2, 3, 4]) }

    it 'four copies of book 1 costs 32GBP' do
      expect(same_books.sell).to eq(32)
    end

    it 'two copies of book 1 and two copies of book 4 costs 30.40GBP' do
      expect(two_and_two_books.sell).to eq(30.4)
    end

    it 'three copies of book 1 and one copy of book 4 costs 31.20GBP' do
      expect(three_and_one_books.sell).to eq(31.2)
    end

    it 'one copy of four different books should cost 25.60GBP' do
      expect(different_books.sell).to eq(25.6)
    end
  end
end
