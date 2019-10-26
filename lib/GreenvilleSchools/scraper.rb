#require 'pry'
class GreenvilleSchools::Scraper
  #url = "https://www.greatschools.org/north-carolina/greenville/schools/?gradeLevels%5B%5D=h&gradeLevels%5B%5D=m&gradeLevels%5B%5D=e"
  
  def pagescrape
    
    url = "https://www.greatschools.org/north-carolina/greenville/schools/?gradeLevels%5B%5D=h&gradeLevels%5B%5D=m&gradeLevels%5B%5D=e"
    schools_list = Nokogiri::HTML(open(url))
    
    schools_array = []
    
    
    schools_list.css("li.unsaved").each do |school|
      name = school.css(".name").text
      address = school.css(".address").text
      page_url = school.css("a").attribute("href").value
      scale = school.css(".scale").text
      school_info = {:name => name,
                :location => address,
                :profile_url => page_url, :scale => scale}
      students_array << school_info
      end
    schools_array
    binding.pry
  end
  
end 