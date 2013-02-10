class Category < ActiveRecord::Base
  validates :year, :presence => {:message => "Kategoria musi byc przypisana do roku"}

  def Category.get_all_years
    years = []
    Category.all.each do |category| 
      years << category.year
    end
    return years.uniq.sort
  end

  def Category.find_by_year_and_type(year, is_expense)
    Category.find(:all, :conditions => {:year => year, :is_expense => is_expense}, :order => "'order' ASC")
  end
end
