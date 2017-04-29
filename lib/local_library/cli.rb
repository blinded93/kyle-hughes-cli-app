class LocalLibrary::CLI
  def call
    puts ""
    puts "Welcome to the local library finder"
    puts "Please enter a zip code to find the nearest library or 'exit' to exit program."
    puts ""
    start
  end

  def start
    zip_code = nil
    while zip_code != 'exit'
      zip_code = gets.strip
      if ZIPS.include?(zip_code)
        puts "Public libraries near #{zip_code}"
        library = LocalLibrary::Scraper.scrape_and_create(zip_code)
        LocalLibrary::Library.libraries.each.with_index(1) do |library, i|
          puts "#{i}. #{library.branch}"
          puts "    #{library.phone}"
          puts "    #{library.address}"
          puts "    #{library.status}"
          puts ""
        end
      else
        puts "That is not a valid zip code, please try again or type 'exit' to exit program."
      end
    end
  end
end
