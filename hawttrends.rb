require 'watir-webdriver'

countries = [0,30,8,44,41,18,13,38,32,43,49,29,50,16,15,48,10,45,
3,19,6,27,4,37,34,21,17,52,51,25,31,47,39,14,36,5,40,23,26,
42,46,12,33,24,35,9,1,28]

trendpausetime = 30 # pause time between trend view

instagram = 'http://instagram.com/'
models = ['awanderingphoto','barrefaeli','catmcneil','idafrosk','satiregram','nasagoddard','keepsy',]
musicfile = "/home/kryptokommunist/Desktop/wallbook/instagram.mp3" # file to be played during insta pic opened
instapausetime = 5 # pause time between clicking pics
picsnum = 20 # number of insta pics to be clicked

cntrcntr = 0 # countrie counter
modelcntr = 0 # model counter

browser = Watir::Browser.new

browser.goto 'http://hawttrends.appspot.com/?r=2&c=2'
browser.send_keys :f11

print 'lets go!'

while(true) do

	if(cntrcntr % 10 == 0) then

		browser.goto instagram + models[modelcntr]
		browser.send_keys :space
		#pid = Process.spawn("timeout " + ((instapausetime + 1) * picsnum).to_s + " cvlc " + musicfile) # timeout kills process after given time
		#Process.detach(pid)
		picsnum.times do |j|
	
			browser.links(:class => 'pgmiImageLink')[j].when_present.click
			sleep(instapausetime)

		end

		modelcntr += 1
		modelcntr = 0 if (modelcntr == models.length)

	end

	
	browser.goto 'http://hawttrends.appspot.com/?r=2&c=2&p=' + countries[cntrcntr].to_s
	cntrcntr += 1
	cntrcntr = 0 if(cntrcntr == countries.length)
	sleep(trendpausetime)

end

