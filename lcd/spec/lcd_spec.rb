require 'lcd'

describe 'LCD' do

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

  context 'Viewing a long LCD digit' do
    let(:four_eight_two) { LCD.new(482) }
    let(:nine_nine_one_three) { LCD.new(9913) }

    it 'should render an LCD display of 482' do
      expected = <<~SQUIGGLY_HEREDOC
            _  _ 
        |_||_| _|
          ||_||_
      SQUIGGLY_HEREDOC

      expect( four_eight_two.render ).to eq( expected )
    end

    it 'should render an LCD display of 9913' do
      expected = <<~SQUIGGLY_HEREDOC
         _  _     _ 
        |_||_|  | _|
         _| _|  | _|
      SQUIGGLY_HEREDOC

      expect( nine_nine_one_three.render ).to eq( expected )
    end
  end
end
