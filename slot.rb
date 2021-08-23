def goodbye
  puts "お疲れさまでした。今回の収支は#{@remain_coin - 100}コインと、#{@point}ポイントです。"  
end

def reset_slot
  @num1 = ""
  @num2 = ""
  @num3 = ""
  @num4 = ""
  @num5 = ""
  @num6 = ""
  @num7 = ""
  @num8 = ""
  @num9 = ""
end

def show_number
  puts "---------------------"
  puts "|#{@num1}|#{@num4}|#{@num7}|"
  puts "|#{@num2}|#{@num5}|#{@num8}|"
  puts "|#{@num3}|#{@num6}|#{@num9}|"
end

def play_slot
  for count in 1..3 do
    _ = gets
    if count == 1
      @num1 = rand(1..9)
      @num2 = rand(1..9)
      @num3 = rand(1..9)
      show_number
    end
    if count ==2
      @num4 = rand(1..9)
      @num5 = rand(1..9)
      @num6 = rand(1..9)
      show_number
    end
    if count == 3
      @num7 = rand(1..9)
      @num8 = rand(1..9)
      @num9 = rand(1..9)
      show_number
    end
  end
end
# ==========下記はcoin_calculationメソッドで使うメソッド=============
def get_coins
  @get_coin = 10 * @bet_coin
  @remain_coin += @get_coin
end
def get_points
  @get_point = 50 * @bet_coin
  @point += @get_point
end
def align(where)
  puts "#{where}列目の数字が揃いました。#{@get_coin}コインと#{@get_point}獲得！"
end
def diagonal
  puts "斜めの数字が揃いました。#{@get_coin}コインと#{@get_point}獲得！"
end
# ===========================================================
def coin_calculation(remain_coin, bet_coin, point)
  @remain_coin = remain_coin - bet_coin  
  if @num1 == @num4 and @num4 == @num7
    get_coins
    get_points
    align("1")
  end
  if @num2 == @num5 and @num5 == @num8
    get_coins
    get_points
    align("2")
  end
  if @num3 == @num6 and @num6 == @num9
    get_coins
    get_points
    align("3")
  end
  # ↓斜めが揃ったとき
  if @num1 == @num5 and @num5 == @num9
    get_coins
    get_points
    diagonal
  end
  if @num3 == @num5 and @num5 == @num7
    get_coins
    get_points
    diagonal
  end
  puts "---------------------"
end

# ====================上記は全てメソッド==========================




# 最初のコインとポイント
@remain_coin = 100
@point = 0

until @remain_coin <= 0
  reset_slot
  puts "残りコイン数　#{@remain_coin}"
  puts "獲得ポイント　#{@point}"
  puts "何コイン入れますか？"
  puts "1（10コイン）2（30コイン）3（50コイン）4（残りコイン全部）5（やめとく）"
  select_number = gets.to_i
  
  if select_number == 1
    @bet_coin = 10
  elsif select_number == 2
    @bet_coin = 30
  elsif select_number == 3
    @bet_coin = 50
  elsif select_number == 4
    @bet_coin = @remain_coin
  elsif select_number == 5
    goodbye
    return
  else 
    puts "上記に指定した数字（半角数字）のみ入力してください。"
    goodbye
    return
  end
  
  puts "エンターを3回押してください！"
  play_slot
  puts "---------------------"
  coin_calculation(@remain_coin, @bet_coin, @point)
  
end #untilのend

goodbye