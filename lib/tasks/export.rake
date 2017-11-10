namespace :export do
  desc "Prints all in a seeds.rb way."
  task :seeds_format => :environment do
    Category.order(:id).all.each do |category|
      puts "Category.create(#{category.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end
