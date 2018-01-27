require "ggxrd_frames/version"
require "ggxrd_frames/characters"
require "ggxrd_frames/column"
require "mechanize"

module GgxrdFrames
  def self.frame_of (character)
    begin
      url = GgxrdFrames::CHARACTERS[character][:url]
      res = Mechanize.new.get(url)
    rescue Mechanize::ResponseCodeError => e
      return nil
    end

    # scraping
    table = res.at(GgxrdFrames::CHARACTERS[character][:selector])
    data = (
      table.search('tr').to_a.map do |row|
        row.search('td').to_a.map do |el|
          (el.at('img') ? el.at('img').attribute('alt') : '').to_s + el.content.strip
        end
      end
    )
    
    # screening
    data.select! {|row| row != []}

    # convert to hash
    data.map do |row|
      Hash[*([COLUMN, row].transpose.flatten)]
    end
  end      
end
