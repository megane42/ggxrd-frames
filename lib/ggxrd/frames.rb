require "ggxrd/frames/version"
require "ggxrd/frames/characters"
require "ggxrd/frames/column"
require "mechanize"

module Ggxrd
  module Frames
    def self.frame_of (character)
      begin
        url = Ggxrd::Frames::CHARACTERS[character][:url]
        res = Mechanize.new.get(url)
      rescue Mechanize::ResponseCodeError => e
        return nil
      end

      # scraping
      table = res.at(Ggxrd::Frames::CHARACTERS[character][:selector])
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
end
