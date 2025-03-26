extends Node

var Lane1MouseOn = false
var Lane2MouseOn = false
var Lane3MouseOn = false
var Lane4MouseOn = false



var Layer1hovering = false






# Level sending to the DB

var http_request : HTTPRequest = HTTPRequest.new()
const SEVER_URL = "http://localhost/EksamensDB.php"
const SECRET_KEY = "1234567890"
var nonce = null
var request_que : Array = []
var is_requesting : bool = false

func _ready():
	
	#Connecting request handler:
	add_child(http_request)
	http_request.connect("request_completed", Callable(self, "_http_request_completed"))
	
func _process(delta: float):
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
	var response = parse_json(response_body)
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
	var data = client.query_string_from_dict({"data" : JSON.print({})})
	var body = "command=get_nonce&" + data
	
	#Make sever request:
	var err = http_request.request(SEVER_URL, SEVER_HEADERS, false, HTTPClient.METHOD_POST, body)
	
	if err !=OK:
		printerr("HTTPRequest error: " + String(err))
		return
	
	print("Requesting nonce...")
	
	
func _send_request():
	var client = HTTPClient.new()
	var data = client.query_string_from_dict({"data" : JSON.print(request['data'])})
	var body = "command=" + request['command'] + "&" + data
	
	#Generate 'response nonce'
	var cnonce = String(Crypto.new().generate_random_bytes(32)).sha256_text()
	
	#Generate security hash:
	var client_hash = (nonce + cnonce + body + SECRET_KEY).sha256_text()
	nonce = null
	
	#Creates custom header for requests:
	var headers = SERVER_HEADERS.duplicate():
	headers.push_back("cnonc:" + cnonce)
	headers.push_back("hash:" + client_hash)
	
	
	#Make sever request:
	var err = http_request.request(SEVER_URL, headers, false, HTTPClient.METHOD_POST, body)
	
	# Check if problem
	if err !=OK:
		printerr("HTTPRequest error: " + String(err))
		return
	
	# Print request in debug
	print("Requesting...\n\tCommand: " + request['command'] + "\n\tbody: " + body)
	
func  _submit_level():
	var id = ""
	var level = 0
	
	var command = "add_level"
	var data = {"level" : level, "id" : id}
	request_que.push_back({"command" : command, "data" : data})
