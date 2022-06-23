require 'pry'

 class Song    
    attr_accessor :name, :artist, :genre

    @@count = 0
    @@genres = []
    @@artists = []
    
    def initialize(name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre
        @@count += 1
        @@genres << genre   #not  @@genres << @genre 
        @@artists << artist #not  @@artists << @artist
    end

    def self.count
        @@count 
    end

    def self.genres
        @@genres.uniq
    end

    def self.artists
        @@artists.uniq
    end

    def self.genre_count
        genre_count = {}

        # ["rap", "rap", "pop"].each do |genre|
        @@genres.each do |genre| # @@genres ["rap", "rap", "pop"]
            if genre_count[genre] # if this exists
            #binding.pry                
            genre_count[genre] += 1 # increment the value in hash, this returns 2
            #binding.pry
            else 
                genre_count[genre] = 1
            end
        end
        genre_count
    end

    def self.artist_count
        artist_count = {}
        
        @@artists.each do |artist| # @@artists ["Jay-Z", "Jay-Z", "Brittany Spears"]
            if artist_count[artist] # if this exists
            artist_count[artist] += 1 # increment the value in hash
            else
                artist_count[artist] = 1
            end
        end
        artist_count     
    end

    # option 2 with .each_with_object
    # def self.artist_count                
    #     @@artists.each_with_object(Hash.new(0)) {|artist, hash| hash[artist] += 1}
    # end
    
    # Iterates the given block for each element with an arbitrary object given, and returns the initially given object.
    # .each_with_object() accepts an optional argument - what it wants to create and can take in default value, 0 in our case
    # in the || order does matter, first is the element we're iterating thru and second is whatever we created

        # [:foo, :bar, :jazz].each_with_object({}) do |item, hash|
        #     hash[item] = item.to_s.upcase
        #   end
        #    => {:foo=>"FOO", :bar=>"BAR", :jazz=>"JAZZ"}

        # (1..10).each_with_object([]) do |item, array|
        #     array << item ** 2
        #   end
        #    => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

    # option 3 but doesn't pass test
    # def self.artist_count                
    #     @@artists.tally
    # end   

end


