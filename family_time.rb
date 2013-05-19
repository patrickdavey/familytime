require 'rubygems'
require 'net/https'
require 'json'

class FamilyTime

  MemberLatitudes = {
    :christchurch => "-43.526,172.596",
    :dublin => "53.357,-6.293",
    :minneapolis => "44.991,-93.289",
    :amsterdam => "52.3727,4.887"
  }
  def initialize()
    @timestamp = Time.now.to_i
  end

  def showtime(latlong)
    url = "https://maps.googleapis.com/maps/api/timezone/json?location=#{latlong}&timestamp=#{@timestamp}&sensor=false"
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.start do |h|
      response = h.request Net::HTTP::Get.new(uri.request_uri)
      return time_in_zone(JSON.parse(response.body)) if Net::HTTPSuccess
    end
    raise "could not get the time"
  end
  def time_in_zone(offset_info)
    n = (@timestamp + offset_info["dstOffset"] + offset_info["rawOffset"]).to_i
    Time.at(n.to_i).utc
  end
end
