class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new
    if params.include?('user_id') && params['user_id'] != ''
      list = flickr.people.getPhotos user_id: params['user_id']
      @imgs = list.map { |img_info| "https://live.staticflickr.com/#{img_info['server']}/#{img_info['id']}_#{img_info['secret']}_w.jpg" }
    else
      @imgs = []
    end
  end
end
