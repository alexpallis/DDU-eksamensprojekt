extends Button

@onready var label: Label = $Label
@onready var money_label: Label = $MoneyLabel

var currdavid

func _ready():
	if Global.money == 0:
		money_label.text = "You are broke"
	else:
		money_label.text ="You have " + str(Global.money) + " Yudos"
var randonumb = currdavid

func _on_pressed():
	if Global.money >= 100:
		Global.money -100
		@warning_ignore("shadowed_variable")
		var currdavid = str(randi() % 11)
		owner.find_child("Inventoria").add_slot(currdavid)
		if Global.money == 0:
			money_label.text = "You are broke"
		else:
			money_label.text ="You have " + str(Global.money) + " Yudos"
		if randonumb == 0:
				Global.Dave += 1
		if randonumb == 2:
				Global.D1 += 1
		if randonumb == 3:
				Global.D2 += 1
		if randonumb == 4:
				Global.D3 += 1
		if randonumb == 5:
			Global.D4 += 1
		if randonumb == 6:
			Global.D5 += 1
		if randonumb == 7:
			Global.D6 += 1
		if randonumb == 8:
			Global.D7 += 1
		if randonumb == 9:
			Global.D8 += 1
		if randonumb == 10:
			Global.D9 += 1
		if randonumb == 11:
			Global.D10 += 1
		if randonumb == 12:
			Global.D11 += 1
		if randonumb == 13:
			Global.D12 += 1
		if randonumb == 14:
			Global.D13 += 1
		if randonumb == 15:
			Global.D14 += 1
		if randonumb == 16:
			Global.D15 += 1
		if randonumb == 17:
			Global.D16 += 1
		if randonumb == 18:
			Global.D17 += 1
		if randonumb == 19:
			Global.D18 += 1
		if randonumb == 20:
			Global.D19 += 1
		if randonumb == 21:
			Global.D20 += 1
		if randonumb == 22:
			Global.D21 += 1
		if randonumb == 23:
			Global.D22 += 1
		if randonumb == 24:
			Global.D23 += 1
		if randonumb == 25:
			Global.D24 += 1
		if randonumb == 26:
			Global.D25 += 1
	#if randonumb == 27:
		#Global.D26 += 1
	#if randonumb == 28:
		#Global.D27 += 1
	#if randonumb == 29:
		#Global.D28 += 1
	#if randonumb == 30:
		#Global.D29 += 1
	#if randonumb == 31:
		#Global.D30 += 1
	#if randonumb == 32:
		#Global.D31 += 1
	#if randonumb == 33:
		#Global.D32 += 1
	#if randonumb == 34:
		#Global.D33 += 1
	#if randonumb == 35:
		#Global.D34 += 1
	#if randonumb == 36:
		#Global.D35 += 1
	#if randonumb == 37:
		#Global.D36 += 1
	#if randonumb == 38:
		#Global.D37 += 1
	#if randonumb == 39:
		#Global.D38 += 1
	#if randonumb == 40:
		#Global.D39 += 1
	#if randonumb == 41:
		#Global.D40 += 1
	#print(currdavid , Global.Dave + Global.D1 + Global.D2 + Global.D3 + Global.D4 + Global.D5 + Global.D6 + Global.D7 + Global.D8 + Global.D9 + Global.D10 + Global.D11)
	
	
	else:
		label.text = "Not Enough Yudos"
