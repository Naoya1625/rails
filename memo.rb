require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する) 3(メモを中止）"

memo_type = gets.chomp.to_s
until memo_type == "1" || memo_type == "2" || memo_type == "3"
  puts "1もう一度入力してください"
  puts "1(新規でメモを作成) 2(既存のメモ編集する 3(メモを中止）)"
  memo_type = gets.chomp.to_s
end
  
if memo_type == "1"

  puts "拡張子を除いたファイルを入力してください"
  memo_title = gets.chomp.to_s 
  # もしファイル名が重複するなら終了する。
  if File.exist?("#{memo_title}.csv")
    puts "#{memo_title}.csv というファイルは既に存在します。"
    exit
  end
  
  puts "メモしたい内容を入力してください(Ctrl+Dで終了）"

  memo_content = readlines
  File.open("#{memo_title}.csv", "w") do |f| 
    f.puts memo_content
  end
  
  
elsif memo_type == "2"
  puts "メモを追加するファイル名を入力してください(拡張子を省略した場合CSVファイルを選択します)"
  memo_title = gets.chomp.to_s
  
  if File.exist?("#{memo_title}.csv")
    puts "メモしたい内容を入力してください"
    memo_content = readlines
    File.open("#{memo_title}.csv", "a") do |f|
      f.puts memo_content
    end
  elsif File.exist?(memo_title) 
    puts "メモしたい内容を入力してください"
    memo_content = readlines
    File.open(memo_title, "a") do |f|
      f.puts memo_content
    end
  else
    puts "入力したファイルは存在しません。"
  end
elsif memo_type == "3"
  puts "メモを中止します"
  exit
end
  


