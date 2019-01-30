# testing script

enum DayOfWeek {MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY}
enum MonthOfYear {JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC}
const NamesOfMonths = {
	JAN: "January", FEB: "February",
	MAR: "March", APR: "April", MAY: "May",
	JUN: "June", JUL: "July", AUG: "August",
	SEP: "September", OCT: "October", NOV: "Novemeber",
	DEC: "December"}

export(int,1,12) var month
export(int,1,31) var day = 1
export(int,2012,2022) var year = 2012
var month_name
var month_length 
# weekday should be dependent
var weekday = MONDAY

func set_name():
	month_name = NamesOfMonths[month]
func set_length():
	match month:
		JAN, MAR, MAY, JUL, AUG, OCT, DEC: month_length = 31
		APR, JUN, SEP, NOV: month_length = 30
		FEB: month_length = 28
func advance_date():
	month.set_name()
	month.set_length()
	if day+1 > month.length:
		day = 1
		if month.index+1 > DEC:
			month.index = JAN
			year += 1
		else:
			month.index += 1
	else:
		day += 1
	month.set_name()
	month.set_length()
