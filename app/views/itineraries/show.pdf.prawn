pdf.font "Helvetica"

pdf.image "#{Rails.root}/app/assets/images/cie_banner.png", :height => 60
pdf.text " "

pdf.text " #{@itinerary.name}", :size => 20, :style => :bold
pdf.text "Duration: #{@itinerary.startdate} to #{@itinerary.enddate}"
pdf.text "Creator: #{@user.name}  |  #{@user.title}", :style => :bold
pdf.text " "
pdf.text "Description: #{@itinerary.description}"

pdf.text " "
pdf.text "Events", :size => 15, :style => :bold
@events.each do |event|
	pdf.text "#{@allevent.name}", :style => :bold
	pdf.text "#{@allevent.description}"
	pdf.text "#{@allevent.duration} minutes"
	pdf.text "#{@allevent.start_datetime}"
	

end