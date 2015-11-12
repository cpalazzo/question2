require 'spec_helper'
require 'int_searcher'
include IntSearcher

describe IntSearcher do

  context "when list input is nil" do
    let(:input_list) { nil }
    let(:target_int) { 1 }

    it 'should raise an error' do
      expect { find_int(input_list, target_int) }.to raise_error('List is nil')
    end
  end

  context "when list input is not a list" do
    let(:input_list) { 1 }
    let(:target_int) { 1 }

    it 'should raise an error' do
      expect { find_int(input_list, target_int) }.to raise_error('List argument is not a list')
    end
  end

  context "when int input is not an int" do
    let(:input_list) { [[1,2,3,4],[5,6,7,8]] }
    let(:target_int) { [1,2] }

    it 'should raise an error' do
      expect { find_int(input_list, target_int) }.to raise_error('Int argument is not an int')
    end
  end

  context "when list input contains an element that is not an array" do
    let(:input_list) { [[1,2,3,4], 1] }
    let(:target_int) { 1 }

    it "should raise an error" do
      expect { find_int(input_list, target_int) }.to raise_error('List contains element that is not an array')
    end
  end

  context "when list input contains an array with size other than 4" do
    let(:input_list) { [[1,2,3,4], [1]] }
    let(:target_int) { 1 }

    it "should raise an error" do
      expect { find_int(input_list, target_int) }.to raise_error('List contains incorrectly sized array')
    end
  end

  context "when the target int is not found in the arrays" do
    let(:input_list) { [[1,2,3,4], [5,6,7,8]] }
    let(:target_int) { 9 }

    it "should return nil" do
      expect(find_int(input_list, target_int)).to be_nil
    end

    it "should output nothing" do
      output = capture_stdout do
        find_int(input_list, target_int)
      end

      expect(output).to eq ""
    end
  end

  context "when the target int is in at least one array" do
    let(:input_list) { [[1,2,3,4], [1,6,7,8], [2,3,4,5]] }
    let(:valid_result_set) { [[1,2,3,4], [1,6,7,8]] }
    let(:target_int) { 1 }

    it "should print one of the arrays containing the target int" do
      output = capture_stdout do
        find_int(input_list, target_int)
      end

      expect(valid_result_set.to_s).to include(output)
    end

    it "should return one of the arrays containing the target int" do
      output = capture_stdout do
        expect(valid_result_set).to include(find_int(input_list, target_int))
      end
    end

    it "should print and return the same array" do
      result_arr = nil
      output = capture_stdout do
        result_arr = find_int(input_list, target_int)
      end

      expect(result_arr.to_s).to eq(output)
    end
  end
end
