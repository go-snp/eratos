require "./eratos_core.rb"
require "./message.rb"

##########################
# コマンドを実行するためのクラス
##########################

class EratosCmd

  # コマンド本体。
  # コマンドライン引数を配列にとり、メッセージを返す。
  def self.run(argv)

    # 引数が0個の場合、usageを返す
    if (argv.length == 0) then
      return MES_USAGE
    end

    arg = argv[0].to_i

    # 引数が2未満の場合、エラーメッセージを返す
    if (arg < 2) then
      return MES_ERR_TOO_SMALL
    end

    result = Eratos.upperBoundOf(arg)
    result_last_index = result.length - 1

    # array.to_sメソッドでの出力は課題の要件を満たさないので、
    # フォーマットして出力する
    output = ""
    for i in 0..result_last_index
      output.concat(result[i].to_s)
      if (i != result_last_index) then
        output.concat(", ")
      end
    end

    return output
  end
end
