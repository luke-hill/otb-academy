require 'lcd'

describe 'LCD' do
  context 'without parameter modifications' do
    context 'viewing a single digit' do
      let(:six) { LCD.new(6) }
      let(:eight) { LCD.new(8) }

      it 'should render a 6' do
        expected = <<~SQUIGGLY_HEREDOC
           _ 
          |_ 
          |_|
        SQUIGGLY_HEREDOC

        expect( six.render ).to eq( expected )
      end

      it 'should render an 8' do
        expected = <<~SQUIGGLY_HEREDOC
           _ 
          |_|
          |_|
        SQUIGGLY_HEREDOC

        expect( eight.render ).to eq( expected )
      end
    end

    context 'viewing multiple digits' do
      let(:four_eight_seven) { LCD.new(487) }
      let(:nine_nine_one_three) { LCD.new(9913) }

      it 'should render 487' do
        expected = <<~SQUIGGLY_HEREDOC
              _  _ 
          |_||_|  |
            ||_|  |
        SQUIGGLY_HEREDOC

        expect( four_eight_seven.render ).to eq( expected )
      end

      it 'should render 9913' do
        expected = <<~SQUIGGLY_HEREDOC
           _  _     _ 
          |_||_|  | _|
           _| _|  | _|
        SQUIGGLY_HEREDOC

        expect( nine_nine_one_three.render ).to eq( expected )
      end
    end
  end

  context 'with parameter modifications' do
    context 'viewing digits with modified width' do
      let(:eight) { LCD.new(8, width: 2) }
      let(:nine_one_three) { LCD.new(913, width: 4) }

      it 'should render a widened 8' do
        expected = <<~SQUIGGLY_HEREDOC
           __ 
          |__|
          |__|
        SQUIGGLY_HEREDOC

        expect( eight.render ).to eq( expected )
      end

      it 'should render a widened 913' do
        expected = <<~SQUIGGLY_HEREDOC
           ____        ____ 
          |____|     | ____|
           ____|     | ____|
        SQUIGGLY_HEREDOC

        expect( nine_one_three.render ).to eq( expected )
      end
    end

    context 'viewing digits with modified height' do
      let(:two) { LCD.new(2, height: 3) }
      let(:eight_seven) { LCD.new(87, height: 4) }

      it 'should render a heightened 2' do
        expected = <<~SQUIGGLY_HEREDOC
          _ 
           |
           |
          _|
         |  
         |  
         |_ 
        SQUIGGLY_HEREDOC

        expect( two.render ).to eq( expected )
      end

      it 'should render a heightened 87' do
        expected = <<~SQUIGGLY_HEREDOC
            _  _ 
           | |  |
           | |  |
           | |  |
           |_|  |
           | |  |
           | |  |
           | |  |
           |_|  |
        SQUIGGLY_HEREDOC

        expect( eight_seven.render ).to eq( expected )
      end
    end

    context 'viewing digits with modified width AND height' do
      let(:eight) { LCD.new(8, height: 3, width: 2) }
      let(:four_seven_one_eight_nine) { LCD.new(47189, height: 5, width: 7) }

      it 'should render a heightened AND widened 8' do
        expected = <<~SQUIGGLY_HEREDOC
         __ 
        |  |
        |  |
        |__|
        |  |
        |  |
        |__|
        SQUIGGLY_HEREDOC

        expect( eight.render ).to eq( expected )
      end

      it 'should render a heightened AND widened 47189' do
        expected = <<~SQUIGGLY_HEREDOC
                  _______           _______  _______ 
        |       |        |        ||       ||       |
        |       |        |        ||       ||       |
        |       |        |        ||       ||       |
        |       |        |        ||       ||       |
        |_______|        |        ||_______||_______|
                |        |        ||       |        |
                |        |        ||       |        |
                |        |        ||       |        |
                |        |        ||       |        |
                |        |        ||_______| _______|
        SQUIGGLY_HEREDOC

        expect( four_seven_one_eight_nine.render ).to eq( expected )
      end
    end
  end
end
