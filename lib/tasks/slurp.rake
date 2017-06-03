# namespace :slurp do
#   desc "TODO"
#   task transactions: :environment do
#
#     require "csv"
#
#     csv_text = File.read(Rails.root.join("lib", "csvs", "booth_book_data_v1(altered).txt"))
#
#     csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
#     csv.each do |row|
#       r = Recommendation.new
#       r.user_num = row["user_num"]
#       r.pseudoID = row["pseudoID"]
#       r.course_id = row["course_id"]
#       r.cluster = row["cluster"]
#       r.course_name = row["couse_name"]
#       r.save
#     end
#     puts "There are now #{Recommendation.count} rows in the recommendations table"
#   end
# end

# the above is the old migration for recommended courses and the below is the new migration for historical courses

namespace :slurp do
  desc "TODO"
  task transactions: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "course_history_new_front_end.txt"))

    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      r = History.new
      r.pseudoID = row["pseudoID"]
      r.course_data = row["course_data"]
      r.course_num = row["course_num"]
      r.year = row["year"]
      r.quarter_num = row["quarter_num"]
      r.quarter_text = row["quarter_text"]
      r.section = row["section"]
      r.save
    end
    puts "There are now #{History.count} rows in the history table"
  end
end
