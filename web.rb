require 'sinatra'
require './family_time'
require 'date'
class MySinatraApp < Sinatra::Base
  get '/' do
    ft = FamilyTime.new
    @times = {}
    FamilyTime::MemberLatitudes.each do |k,v|
      @times[k] = ft.showtime(v)
    end
    erb :index
  end
end
