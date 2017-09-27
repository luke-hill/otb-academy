require 'lcd'

describe 'Selling Harry Potter books' do

  context 'Viewing a single LCD digit' do
    let(:six) { LCD.new(6) }
    let(:eight) { LCD.new(8) }

    it 'should render an LCD 6' do
      expected = <<~SQUIGGLY_HEREDOC
         _ 
        |_ 
        |_|
      SQUIGGLY_HEREDOC

      expect( six.render ).to eq( expected )
    end

    it 'should render an LCD 8' do
      expected = <<~SQUIGGLY_HEREDOC
         _ 
        |_|
        |_|
      SQUIGGLY_HEREDOC

      expect( eight.render ).to eq( expected )
    end
  end

end
