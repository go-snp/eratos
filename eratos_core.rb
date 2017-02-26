require "complex"

##########################
# エラトステネスの篩の本体。
# 純粋な整数を受け取り、結果を純粋な整数のリストとして返す。
##########################
class Eratos

  # 与えられた2以上の整数を最大値として、2からその数字までの素数の集合を返す。
  # 整数以外、および2未満の整数が与えられたときの動作を保証しない。
  def self.upperBoundOf(upper_bound)
    ## upper_boundの平方根を求めておく
    root_upper_bound = Math.sqrt(upper_bound)

    # 探索リストと素数リストの初期化
    search_list = generate_search_list(upper_bound) # 2は除かれているので注意
    prime_list = [ 2 ]  # 2は確実に素数なのであらかじめリストに加える

    ## 倍数のふるい落とし
    while (search_list.length > 0)

      prime_factor = search_list[0]
      # 探索リストの先頭が最大値の平方根に達したら終了
      if (prime_factor >= root_upper_bound) then
        break
      end

      # 先頭値の探索リストから素数リストへの移動
      search_list.delete_at(0)
      prime_list << prime_factor

      # 倍数の除去
      i = 1
      loop do
        multiple = prime_factor * i
        search_list.delete(multiple)

        i += 1
        if (multiple > upper_bound) then
          break
        end

      end

    end

    prime_list.concat(search_list)
    return prime_list
  end

  # 初期化された探索リストを返す。
  # 探索リストは2を含まない。
  def self.generate_search_list(upper_bound)
    # 2は確実に素数なので、初期化の時点で探索リストから除外する
    search_list = []

    # 3以降の奇数（upper_boundを含まない）を探索リストに収める。
    # 本来なら全部入れるところだが、計算量節約のため、2の倍数はスキップして入れていく
    i = 1
    loop do
      # i回目のループでリストに加えるか検討するのは奇数2i+1。
      odd_to_add = 2 * i + 1
      if (odd_to_add >= upper_bound) then
        break
      end

      search_list << odd_to_add
      i += 1
    end

    # 最後にupper_boundをリストに加える。
    # ただしupper_bound = 2のときは加えない(リストは2を含まないという制約を満たすため)
    if (upper_bound > 2) then
      search_list << upper_bound
    end

    return search_list
  end

end
