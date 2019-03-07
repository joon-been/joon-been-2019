extends Node

# Game DateTime Factor...
# this a factor to deltaSum each frame, so the in game "time speed"
# or the scale of game time with respect to real time will be 
# by this adjusted by this factor
# Think of it as the quotient of 
# change-of-game-time by change-of-real-time 
const GDF = sqrt(2)

# frame to frame sum of delta...
var deltaSum = float()
# current game datetime in seconds from 2012 Jan 1 00:00
var DateTime = int()
# following are vars that describe DateTime 
var Seconds = int()
var Minutes = int()
var Hours = int()
var wDays = int() # current day wrt current week
var mDays = int() # current day wrt current month
var Month = int()
var Year = int()

# domain of Years, from 2012 to 2020
const Years = [ 
	2012, 2013, 2014, 2015, 2016, 
	2017, 2018, 2019, 2020 ]
# length of year in days <-- Not leap!
const yd = 365
# num of days needed to be in index year
const daysOfYears = [ 
	0, yd+1, yd+0, yd+0, yd+0, yd+1, yd+0, yd+0, yd+0, yd+1 ]
# names of months
enum monthsOfYear {
	jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec }
const monthName = {
	jan:"January", feb:"February", mar:"March", 
	apr:"April", may:"May", jun:"June", jul:"July",
	aug:"August", sep:"September", oct:"October",
	nov:"November", dec:"December" }
# length of months if year is not a leap year
const monthsInDays = [
	31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
# length of months if year is a leap year
const leapMonthsInDays = [
	31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
# names of days of week
enum daysOfWeek { sun, mon, tue, wed, thu, fri, sat }
const wDayName = {
	sun:"Sunday", mon:"Monday", tue:"Tuesday", 
	wed:"Wednesday", thu:"Thursday", fri:"Friday", 
	sat:"Saturday" }
# number of days in week
const weekInDays = 7
# number of hours in day
const dayInHours = 24
# number of minutes in hour
const hourInMinutes = 60
# number of seconds in Minute
const minuteInSeconds = 60

# _ready function sets DateTime
# to 0 for new game, to retrieved value for load game
func _ready():
	# Recall current time and date from file!! 
	# For now, just set to 0...
	DateTime = 0
	first_fill_time()
	pass

# _process updates dateTime and associated junk ea. frame
func _process(delta):
	deltaSum += delta * GDF
	advance_time()

# advance_time does all the "associated junk" mentioned in _process
func advance_time():
	if deltaSum >= 1:
		DateTime += 1
		deltaSum -= 1
	first_fill_time()
	print_time()

func first_fill_time():
	# 1st Set Time
	Seconds = DateTime % minuteInSeconds
	var tMinutes = int(DateTime / minuteInSeconds)
	Minutes = tMinutes % hourInMinutes
	var tHours = int( tMinutes  / hourInMinutes)
	Hours = tHours % dayInHours
	# 1st Set Weekday
	var tDays = int( tHours / dayInHours)
	wDays = tDays % weekInDays
	# 1st Set Year
	var indexYear = int(0)
	for duration in daysOfYears:
		if( (tDays - duration) >= 0 ):
			indexYear += 1
			tDays -= duration
	Year = Years[indexYear - 1]
	# 1st Set Month
	var indexMonth = int(0)
	if( (Year % 4) == 0 ): # if divisable by 4
		for duration in leapMonthsInDays:
			if( (tDays - duration) >= 0 ):
				indexMonth += 1
				tDays -= duration
	Month = indexMonth
	mDays = tDays + 1

func print_time():
	print(wDayName[wDays],", ",
		Year,"C.E. ",monthName[Month]," ",mDays," ",
		Hours,":",Minutes,":",Seconds,"\n")
