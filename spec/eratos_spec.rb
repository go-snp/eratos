require File.expand_path(File.dirname(__FILE__) + '/../eratos_cmd')
require File.expand_path(File.dirname(__FILE__) + '/../message')

describe EratosCmd do

  describe "引数が0個のとき、usageを返す" do
    specify { expect(EratosCmd.run([])).to eq MES_USAGE }
  end

  describe "無効な引数(数字を含まない引数)を0とみなし、エラーを返す" do
    specify { expect(EratosCmd.run(["aabb"])).to include MES_ERR_TOO_SMALL }
  end

  describe "2未満の引数に対してエラーを返す" do
    specify { expect(EratosCmd.run(["1"])).to include MES_ERR_TOO_SMALL }
  end

  describe "2以上の引数に対して素数の列を返す" do
    specify { expect(EratosCmd.run(["2"])).to eq "2" }
    specify { expect(EratosCmd.run(["3"])).to eq "2, 3" }
    specify { expect(EratosCmd.run(["30"])).to eq "2, 3, 5, 7, 11, 13, 17, 19, 23, 29" }
    specify { expect(EratosCmd.run(["31"])).to eq "2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31" }
    specify { expect(EratosCmd.run(["120"])).to eq "2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113" }
  end

end
