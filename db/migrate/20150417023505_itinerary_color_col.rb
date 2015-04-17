class ItineraryColorCol < ActiveRecord::Migration
  def change
  	add_column(:itineraries, :color, :string, null: false, default: "#aeaffa");
  	add_column(:events, :color, :string, null: false, default: "#0A0D9C");
  end
end