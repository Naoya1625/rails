#あっちむいてほいの判定メソッド
def result(winer) 
  if ( @your_hoi_name == @partners_hoi_name)
    puts "あなた:「#{@your_hoi_name}」 相手:「#{@partners_hoi_name}」"
    puts "#{winer}の勝利です！"
    exit
  else
    puts "あなた:「#{@your_hoi_name}」 相手:「#{@partners_hoi_name}」"
    puts "もう一度最初から！\n--------------------------"
    janken
   
  end
end

#hoi_flagを渡す: じゃんけんにあなた→　0勝ち　１あいこ　２負け
def hoi(flag) #メソッド呼び出しで引数を渡すこと！
  puts "あっちむいて....."
  puts "0(上), 1(右), 2(左), 3(右)"
  your_hoi = gets.chomp
  
  #選択肢以外を選択した場合もう一度入力してもらう。
  until your_hoi == "0" || your_hoi == "1" || your_hoi == "2" || your_hoi == "3"
    puts "もう！真面目にやってくださいね！\nもう一度入力してください!"
    puts "あっちむいて.....\n"
    puts "0(上), 1(右), 2(左), 3(右)"
    your_hoi = gets.chomp
  end
  
  partners_hoi = [ 0 ,1, 2, 3 ].sample
  hoi_all = [ "上", "下", "左", "右" ]
  @your_hoi_name = hoi_all[your_hoi.to_i]
  @partners_hoi_name = hoi_all[partners_hoi]
  
  case flag
    when 0 #あなたがジャンケンに勝った場合のあっち向いてホイ
      result("あなた")
    when 1 #あなたがジャンケンに負けた場合のあっち向いてホイ
      result("相手")
  end

end
#-----------------------------------------------------------
def janken(message = "じゃんけん......\n ")
  puts message
  
  puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
  
  your_hand = gets.chomp.to_s
  puts "--------------------------"
  partners_hand = %w[ 0 1 2 ].sample
  
  until your_hand == "0" || your_hand == "1" || your_hand == "2" || your_hand == "3"
  
    puts "そんな選択肢はありませんよ！\nもう一度入力してください！"
    puts "じゃんけん......"
    puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
    your_hand = gets.chomp.to_s
  
  end
  
  weapons = [ "グー", "チョキ", "パー" ]
  
  if (your_hand == "0" && partners_hand == "1") || (your_hand == "1" && partners_hand == "2") || (your_hand == "2" && partners_hand == "0") 
    puts "あなた:#{weapons[your_hand.to_i]}"
    puts "相手:#{weapons[partners_hand.to_i]}\n"
    puts "あなたはジャンケンに勝利しました！\n次はあっち向いてホイだ！"
    hoi_flag = 0
    hoi(hoi_flag)
  elsif your_hand == partners_hand
    janken("あいこです！\nあいこで......\n ")
  
  else
    if your_hand == "3"
      puts "戦わないことを選んだため、あなたは負けました!"
      exit
    else
      puts "あなた:#{weapons[your_hand.to_i]}"
      puts "相手:#{weapons[partners_hand.to_i]}\n"
      puts "あなたはジャンケンに負けました。\n次はあっち向いてホイだ！"
      hoi_flag = 1
      hoi(hoi_flag)
      exit
    end
  end
end


janken