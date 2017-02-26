require File.expand_path(File.dirname(__FILE__) + '/../eratos_cmd')

describe Eratos do

  describe "探索リストが正しく生成される" do
    specify { expect(Eratos.generate_search_list(2)).to eq  [ ] }
    specify { expect(Eratos.generate_search_list(3)).to eq  [ 3 ] }
    specify { expect(Eratos.generate_search_list(15)).to eq [ 3, 5, 7, 9, 11, 13, 15 ] }
  end

  describe "素数の集合が正しく出力される" do
    specify { expect(Eratos.upperBoundOf(2)).to eq [ 2 ] }
    specify { expect(Eratos.upperBoundOf(3)).to eq [ 2, 3 ] }
    specify { expect(Eratos.upperBoundOf(30)).to eq [ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 ] }
    specify { expect(Eratos.upperBoundOf(31)).to eq [ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31 ] }
    specify { expect(Eratos.upperBoundOf(120)).to eq [ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113 ] }
  end
end
