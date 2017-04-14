require 'restclient'
require 'json'

class Instum < ActiveRecord::Base

  scope :artist, -> (ig_text) { Artist.where("name LIKE ?", "%ig_text%") }


def self.save_data_from_instagram
  response = RestClient.get("https://api.instagram.com/v1/users/self/feed?access_token=1070035545.a75aacd.754832cefd5f4c9883c7c914cdb2fc89")
  instagram_data = JSON.parse(response)
  instagrams = instagram_data["data"].map do |item|
    i = Instum.create!
    i.ig_username = item["user"]["username"]
    i.ig_fullname = item["user"]["full_name"]
    i.ig_user_profilpic_url = item["user"]["profile_picture"]
    i.ig_text = item["caption"]["text"]
    i.date = Time.at(item["created_time"].to_i)
    i.ig_img_url = item["images"]["standard_resolution"]["url"]
    i.ig_location = item["location"]
    i.save
    i
  end
  instagrams.select(&:persisted?)
end


end

