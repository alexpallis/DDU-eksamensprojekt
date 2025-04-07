extends Node

var Lane1MouseOn = false
var Lane2MouseOn = false
var Lane3MouseOn = false
var Lane4MouseOn = false



var Layer1hovering = false


# Level sending to the DB

var http_request : HTTPRequest = HTTPRequest.new()
const SERVER_URL = "http://localhost/EksamensDB.php"
const SERVER_HEADERS = ["Content-Type: application/x-www-form-urlencoded", "Cache-Control: max-age=0"]
const SECRET_KEY = "1234567890"
var nonce = null
var request_que : Array = []
var is_requesting : bool = false

var StandardCoinSpeed = 1
var CoinSpeed = 1
var Coin = 0

var mony = 0


func _ready():
	
	#Connecting request handler:
	add_child(http_request)
	http_request.connect("request_completed", Callable(self, "_http_request_completed"))
	
func _process(delta: float):
	#gamecoin 
	Coin += CoinSpeed * delta


	if is_requesting:
		return
		
		
	if request_que.is_empty():
		return
		
		
	is_requesting = true
	if nonce == null:
		request_nonce()
	else:
		_send_request(request_que.pop_front())
		
	
func _http_request_completed(_result, _response_code, _headers, _body):
	is_requesting = false
	if _result != HTTPRequest.RESULT_SUCCESS:
		printerr("Error w/ connection: " + String(_result))
		return
	
	var response_body = _body.get_string_from_utf8()
	#Grab JSON, handle errors reported by PHP:
	var json_conv = JSON.new()
	json_conv.parse(response_body)
	var response = json_conv.get_data()
	#var response = parse_json(response_body) forhenværende kode rigtige ovenfor.
	if response['error'] != "none":
		printerr("We returned error: " + response['error'])
		return
	
	#Check if nonce were requested:
	if response['command'] == 'get_nonce':
		nonce = response['result']['nonce']
		print("Got nonce: " + response['result']['nonce'])
		return
	
	#if not nonce request but else:
	print("Response Body:\n" + response_body)
	
	
	
	
func request_nonce():
	var client = HTTPClient.new()
	var data = client.query_string_from_dict({"data" : JSON.stringify({})})
	var body = "command=get_nonce&" + data
	
	#Make sever request:
	var err = http_request.request(SERVER_URL, SERVER_HEADERS, HTTPClient.METHOD_POST, body)
	
	if err !=OK:
		printerr("HTTPRequest error: " + String(err))
		return
	
	print("Requesting nonce...")
	
	
func _send_request(request: Dictionary):
	var client = HTTPClient.new()
	var data = client.query_string_from_dict({"data" : JSON.stringify(request['data'])})
	var body = "command=" + request['command'] + "&" + data
	
	#Generate 'response nonce'
	var cnonce = str(Crypto.new().generate_random_bytes(32)).sha256_text()
	
	#Generate security hash:
	var client_hash = (nonce + cnonce + body + SECRET_KEY).sha256_text()
	nonce = null
	
	#Creates custom header for requests:
	var headers = SERVER_HEADERS.duplicate()
	headers.push_back("cnonc:" + cnonce)
	headers.push_back("hash:" + client_hash)
	
	
	#Make sever request:
	var err = http_request.request(SERVER_URL, headers, HTTPClient.METHOD_POST, body)
	
	# Check if problem
	if err !=OK:
		printerr("HTTPRequest error: " + String(err))
		return
	
	# Print request in debug
	print("Requesting...\n\tCommand: " + request['command'] + "\n\tbody: " + body)
	
	#Level function
	
func  _submit_level():
	var id = ""
	var level = 0
	
	var command = "add_level"
	var data = {"level" : level, "id" : id}
	request_que.push_back({"command" : command, "data" : data})
	
	#The same function but coins
	
func _submit_coins():
	var id = ""
	var coins = 0
	var command = "add_coins"
	var data = {"coins" : coins, "id" : id}
	request_que.push_back({"command" : command, "data" : data})
	
	#The same function but for units
	
func _submit_units():
	
	var id = ""
	var Dave = 0
	var D1 = 0
	var D2 = 0
	var D3 = 0
	var D4 = 0
	var D5 = 0
	var D6 = 0
	var D7 = 0
	var D8 = 0
	var D9 = 0
	var D10 = 0
	var D11 = 0
	var D12 = 0
	var D13 = 0
	var D14 = 0
	var D15 = 0
	var D16 = 0
	var D17 = 0
	var D18 = 0
	var D19 = 0
	var D20 = 0
	var D21 = 0
	var D22 = 0
	var D23 = 0
	var D24 = 0
	var D25 = 0
	var D26 = 0
	var D27 = 0
	var D28 = 0
	var D29 = 0
	var D30 = 0
	var D31 = 0
	var D32 = 0
	var D33 = 0
	var D34 = 0
	var D35 = 0
	var D36 = 0
	var D37 = 0
	var D38 = 0
	var D39 = 0
	var D40 = 0
	var D41 = 0
	var D42 = 0
	var D43 = 0
	var D44 = 0
	var D45 = 0
	var D46 = 0
	var D47 = 0
	var D48 = 0
	var D49 = 0
	
	var command = "add_units"
	var data = {"Dave" : Dave,"D1" : D1 , "D2" : D2, "D3" : D3, "D4" : D4, "D5" : D5, "D6" : D6, "D7" : D7, "D8" : D8, "D9" : D9, "D10" : D10, "D11" : D11, "D12" : D12, "D13" : D13, "D14" : D14, "D15" : D15, "D16" : D16, "D17" : D17, "D18" : D18, "D19" : D19, "D20" : D20, "D21" : D21, "D22" : D22, "D23" : D23, "D24" : D24, "D25" : D25, "D26" : D26, "D27" : D27, "D28" : D28, "D29" : D29, "D30" : D30, "D31" : D31, "D32" : D32, "D33" : D33, "D34" : D34, "D35" : D35, "D36" : D36, "D37" : D37, "D38" : D38, "D39" : D39, "D40" : D40, "D41" : D41, "D42" : D42, "D43" : D43, "D44" : D44, "D45" : D45, "D46" : D46, "D47" : D47, "D48" : D48, "D49" : D49,  "id" : id}
	request_que.push_back({"command" : command, "data" : data})
