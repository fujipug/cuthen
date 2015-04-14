pdf.font "Helvetica"

pdf.image "#{Rails.root}/app/assets/images/collab.png"
pdf.text " #{@itinerary.name}", :size => 30, :style => :bold
pdf.text "Duration: #{@itinerary.startdate} to #{@itinerary.enddate}"
pdf.text "Creator: #{@user.name}  |  #{@user.title}", :style => :bold
pdf.text " "
pdf.text "Description: #{@itinerary.description}"

pdf.text " "
pdf.text "Events", :size => 20, :style => :bold
@events.each do |event|
	pdf.text "#{@allevent.name}", :style => :bold
	pdf.text "#{@allevent.description}"
	pdf.text "#{@allevent.duration} minutes"
	pdf.text "#{@allevent.start_datetime}"
	

end