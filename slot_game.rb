@my_coin = 100  # 手持ちのコイン初期化
@my_point = 0  # 保有ポイント初期化
@first_game_flag = 0  # 最初のゲームにだけ「スロットゲームへようこそ！」を表示するためのフラグ
@coins = [ 10, 30, 50, @my_coin]  # 投入時選択できるコイン枚数の種類
# スロットゲームを行うメソッド
def slot_game_start
  # コインが足りなかったらスロットを終了させる
  if @my_coin < 0
    puts "コインが足りません。スロットゲームを終了します。"
    exit
  end
  puts "------------------------------------------------"
  puts "スロットゲームへようこそ！" if @first_game_flag == 0
  puts "あなたは現在「#{@my_coin}コイン」と「#{@my_point}ポイント」持っています。\n " if @my_coin > 0
  puts "あなたはコインを持っていません。ポイントは「#{@my_point}ポイント」持っています。\n " if @my_coin == 0
  puts "数字が3つ揃うと、入れたコインの10倍と、500ポイント獲得できます。"
  puts "数字が斜め方向に揃った場合、ボーナスとしてさらに500ポイント獲得できます。\n "

  puts "0(10コイン)  1(30コイン)  2(50コイン) 3(スロットゲーム終了)"
  @insert_coins = gets.chomp


  # 選択肢以外の数字を押した場合
  unless @insert_coins == "0" || @insert_coins == "1" || @insert_coins == "2"
    exit if @insert_coins == "3"
    puts "選択肢から選んで入力してください。"
    @first_game_flag = 1
    slot_game_start
  end

  if @my_coin < @coins[@insert_coins.to_i]
    puts "コインが足りません。"
    exit if @my_coin == 0
    slot_game_start
  elsif (@my_coin - @coins[@insert_coins.to_i]) >= 0
    puts "「#{@coins[@insert_coins.to_i]}枚」のコインを入れました。" 
  else
    puts "スロットを終了します。"
    exit
  end
  # 何コイン入れたかによって手持ちのコインを減らす
  @my_coin = @my_coin - @coins[@insert_coins.to_i]

  puts "エンターを３回押しましょう。"
  @slot_numbers = (1..9).to_a
  gets

  # ランダムに１から９のどれかを返すメソッド
  def random_number
    return @slot_numbers.sample
  end
  @f1 = random_number
  @f2 = random_number
  @f3 = random_number
  @s1 = random_number
  @s2 = random_number
  @s3 = random_number
  @t1 = random_number
  @t2 = random_number
  @t3 = random_number

  puts "------------------------------------------------"
  puts "|#{@f1}| | |\n|#{@f2}| | |\n|#{@f3}| | |"
  gets
  puts "------------------------------------------------"
  puts "|#{@f1}|#{@s1}| |\n|#{@f2}|#{@s2}| |\n|#{@f3}|#{@s3}| |"
  gets
  puts "------------------------------------------------"
  puts "|#{@f1}|#{@s1}|#{@t1}|\n|#{@f2}|#{@s2}|#{@t2}|\n|#{@f3}|#{@s3}|#{@t3}|"
  gets

  three_seven_check
end

#数字が3つ揃ったかを判定するメソッド
def three_seven_check
  if (@f1 == @f2 && @f1 == @f3) || (@s1 == @s2 && @s1 == @s3) || (@t1 == @t2 && @t1 == @t3)
    # 縦方向に数字が3つ揃った場合(コインを+100,ポイントを+500)
    puts "縦方向に数字が揃いました！"
    calc_coin_and_point( 500 )

  elsif (@f1 == @s1 && @f1 == @t1) || (@f2 == @s2 && @f2 == @t2) || (@f3 == @s3 && @f3 == @t3) 
    # 横方向に数字が3つ揃った場合(コインを+100,ポイントを+500)
    puts "横方向に数字が揃いました！"
    calc_coin_and_point( 500 )

  elsif (@f1 == @s2 && @f1 == @t3) || (@f3 == @s2 && @f3 == @t1)
    # 斜め方向に数字が3つ揃った場合(コインを+100,ポイントを+1000)
    puts "斜め方向に数字が揃いました！"
    calc_coin_and_point( 1000 )

  else
    # 数字が何も揃わなかった場合(コイン,ポイントは不変)
    puts "残念でした！"
  end
  @first_game_flag = 1
  slot_game_start
end

# コインとポイントの計算メソッド
def calc_coin_and_point(point)
  @my_coin += ( @coins[@insert_coins.to_i] * 10 )
  @my_point += point
  if point == 500 #数字が揃った場合と揃わなかった場合で分岐
    puts "コインを#{@coins[@insert_coins.to_i] * 10}枚獲得！"
    puts "#{point}ポイント獲得！"
  elsif point == 1000
    puts "コインを#{@coins[@insert_coins.to_i] * 10}枚獲得！"
    puts "#{point}ポイント獲得！"
  else
    puts "残念でした！"
  end
end

slot_game_start