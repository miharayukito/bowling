# ボウリングのスコアを管理するクラス
class Bowling
    def initialize
        @total_score = 0
        # 全体のスコアを格納する配列
        @scores = []
        # 一時保存用の配列
        @temp = []
    end

    # スコアの合計を返す
    def total_score
        @total_score
    end

    # スコアを追加する
    def add_score(pins)
        # 一時保存用のスコアに倒したピンの数を追加する
        @temp << pins
        # ２段分のデータが入っていれば、１フレーム分のスコアとして全体に追加する
        if @temp.size == 2
            @scores << @temp
            @temp = []
        end
    end

    # スコアの合計を計算する
  def calc_score
    @scores.each.with_index(1) do |score, index|
      # 最終フレーム以外でのスペアなら、スコアにボーナスを含めて合計する
      if spare?(score) && not_last_frame?(index)
        @total_score += calc_spare_bonus(index)
      else
        @total_score += score.inject(:+)
      end
    end
  end

  private
  # スペアかどうか判定する
  def spare?(score)
    score.inject(:+) == 10
  end

  # 最終フレーム以外かどうか判定する
  def not_last_frame?(index)
    index < 10
  end

  # スペアボーナスを含んだ値でスコアを計算する
  def calc_spare_bonus(index)
    10 + @scores[index].first
  end
end


# @game = Bowling.new

# 20.times do
#     @game.add_score(1)
# end

# puts @game.total_score == 20
