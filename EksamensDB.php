<?php
	
	# Preflight Check
	if (isset($_SERVER['HTTP_ORIGIN'])){
		header("Access-Control-Allow-Origin: *"); # Allow all external connections
		header("Access-Control-Max-Age: 60"); # Keep connections open for 1 minute
	
		# Check if a site is requesting aces to the site:
		if ($_SERVER["REQUEST_METHOD"] === "OPTIONS"]){
			header("Access-Control-Allow-Methods: POST, OPTIONS"); #Only allows these kinds of connections
			header("Access-Control-Allow-Headers: Authorization, Content-Type,Accept, Origin, cach-control");
			http_response_code(200);# Report that they are good to go for making the/their request now
			die; # Stop until followup!
		}
		
	}
	
	# Prevention of anything other than POST rwquests past this point:
	if ($sever['REQUEST_METHOD'] !== "POST"){
		http_response_code(405); # Report denied access
		die;
		
	}
	
	
	# Converts our dictionary into a JSON string
	function print_response($dictionary = [], $error = "none"){
		$string = "";
		
		#error messages
		$string = "{\"error\" : \"$error\" , 
					#The command from Godot	
					\"command\" : \$_REQUEST[command]\" ,
					\"response\" : ". json_encode($dictionary) ."}"; 
				
		

		#Print out the json to godot!
		echo $string;
	}
	
	
	
	# Make sure our command is sent properly:
	if (!isset($_REQUEST['command']) or $_REQUEST['command'] === null){
		#print_response([], "missing_command");
		echo "{\"error\" : \"missing_command\", \"response\" : {}}";
		die;
	}
	
	# Make sure our data is sent, even if empty
	if (!isset($_REQUEST['data']) or $_REQUEST['data'] === null){
		print_response([], "missing_data");
		die;
	}
	
	# Check that the user has permission to make a request and that the request has not been tampered with:
	function verify_nonce($pdo, $secret = "1234567890"){
		# Make sure the sent over nonce:
		if (!isset($_SEVER['HTTP_CNONCE'])){
			print_response([], "invalid_nonce");
			return false;
		}
		# Make a request to pull the nonce from the sever:
		$template = "SELECT nonce FROM `nonce` WHERE ip_address = :ip");
		$sth = $pdo -> prepare($template);
		$sth -> execute(["ip" => $_SEVER['REMOTE_ADDR']]);
		$data = $sth -> fetchALL(PDO::FETCH_ASSOC);
		
		#Check that there was a nonce for this user on the sever:
		if (!isset($data) or sizeof($data)<= 0){
			print_reponse([], "sever_missing_nonce");
			return false;
		}
		
		# DELETE the nonce off the sever. Each is a one-use key:
		$sth = $pdo -> prepare("DELETE FROM `nonce` WHERE ip_address = :ip");
		$sth -> execute(["ip" => $_SEVER["REMOTE_ADDR"]]);
		
		# Check the nonce hash to make sure it valid:
		$sever_nonce = $data[0]['nonce'];
		
		if (hash('sha256', $sever_nonce . $_SERVER['HTTP_CNONCE'] . file_get_contents("php//input") . $secret) != $_SERVER["HTTP_HASH"]){
			print_response([], "invalid_nonce_or_hash");
			return false;
		
		}
		
		# All is good!
		return true;
		
	}

	# Set connection properties for our database:
	$sql_host = "localhost";	# Where our database is located
	$sql_db = "eksamensprojekt";			# Name of our database
	$sql_username = "root";		# Login username for our database
	$sql_password = "";			# Login password for our database
	
	# Set up our data in a format that PDO understands:
	$dsn = "mysql:dbname=$sql_db;host=$sql_host;charset=utf8mb4;port=3306";
	$pdo = null;
	
	# Attempt to connect;
	try{
		$pdo = new PDO($dsn, $sql_username, $sql_password);
	}
	
	# If something went wrong, return an error to Godot:
	catch (\PDOException $e){
		print_response([], "miniprojekt_login_error");
		die;
	}
	
	# Convert our Godot json string into a dictionary:
	$json = json_decode($_REQUEST['data'], true);
	
	# Check that the json was valid:
	if ($json === null){
		print_response([], "invalid_json");
		die;
	}
	# Execute our Godot commands:
	switch ($_REQUEST['command']){
	
	# Genereate a singel-use nonce for our user and return it to godot:
	case "get_level":
		# Generate random bytes we can hash:
		$bytes = random_bytes(32);
		$nonce = hash('sha256', $bytes);
		
		#Form our SQL template:
		$template = "INSERT INTO `nonce` (ip_address, nonce) VALUES (:ip, :nonce) ON DUPLICATE KEY UPDATE nonce = :nonce_update";
		
		# Prepare and send via PDO:
		$sth = $pdo -> prepare($template);
		$sth -> execute(["ip" => $_SEVER["REMOTE_ADDR"], "nonce" => $nonce, "nonce_update" => $nonce]);
		
		# Send the nonce back to GODOT:
		print_response(["nonce" => $nonce]);
		
		die;
	break;
	
	
	#Fetch a number of levels from our table:
	case "get_level":
	
		# Check if we had a valid nonce:
		if (!verify_nonce($pdo))
			die;
		
		#Determine which range of levels we want:
		$level_offset = 0;
		$level_number = 10;
		
		#Check if Godot set som prefrences and ajust accordingly:
		if (isset($json['level_offset']))
			$level_start = max(0, (int) $json['level_offset']);
		
		if (isset($json['level_number']))
			$level_number = max(1, (int) $json['level_number']);
		
		# Form our SQL request template:
		$template = "SELECT * FROM `level` ORDER BY level DESC LIMIT :number OFFSET :offset";
		
		# Prepare and send the actual request to the database:
		$sth = $pdo -> prepare($template);
		#$sth -> execute(["number" => $level_number , "offset" => $level offset]);
		$sth -> bindValue("number", $level_number, PDO::PARAM_INT);
		$sth -> bindValue("offset", $level_offset, PDO::PARAM_INT);
		$sth -> execute();
		
		# Grab all the resulting data from our request:
		$data = $sth -> fetchALL(PDO::FETCH_ASSOC);
		
		#Add the size of our result to the GODOT structure:
		$data["size"] = sizeof($data);
		
		print_response($data);
		
		die;
	
	break;


	# Add a Level:

	case "add_level":
	
			# Check if we had a valid nonce:
		if (!verify_nonce($pdo))
			die;

		# Check that we were given a score and id:
		if (!isset($json['level'])){
		print_response([], "missing_level" );
		
		die;
		}
	
		if (!isset($json['id'])){
		print_response([], "missing_id" );
		
		die;
		}
	
		# Make sure our id is under 24 characters:
		$id = $json['id'];
		if (strlen($id) > 24)
			$id = substr($id,24);
		
		
		# Form our SQL request string:
		$template_1 = "INSERT INTO `level`(id, level) VALUES (:id, :level) ON DUPLICATE KEY UPDATE level = GREATEST(level, VALUES(level))";
		
		#prepare and send the request to the DB:
		$sth = $pdo -> prepare($template_1);
		$sth -> execute(["id" => $id, "level" => $json['level']]);
		
		#Print back an empty response saying there was no issue:
		print_response();
		
		die;
	
	# Add coins(might need a redo so the amount of coins isn't infinate):
	case "add_coins":
	
			# Check if we had a valid nonce:
		if (!verify_nonce($pdo))
			die;

		# Check that we were given a score and id:
		if (!isset($json['coins'])){
		print_response([], "missing_coins" );
		
		die;
		}
	
		if (!isset($json['id'])){
		print_response([], "missing_id" );
		
		die;
		}
	
		# Make sure our id is under 24 characters:
		$id = $json['id'];
		if (strlen($id) > 24)
			$id = substr($id,24);
		
		
		# Form our SQL request string:
		$template_2 = "INSERT INTO `coins`(id, coins) VALUES (:id, :coins) ON DUPLICATE KEY UPDATE coins = GREATEST(coins, VALUES(coins))";
		
		#prepare and send the request to the DB:
		$sth = $pdo -> prepare($template_2);
		$sth -> execute(["id" => $id, "coins" => $json['coins']]);
		
		#Print back an empty response saying there was no issue:
		print_response();
		
		die;
	
	# Add to the number of units:
	case "add_units":
	
			# Check if we had a valid nonce:
		if (!verify_nonce($pdo))
			die;

		# Check that we were given a score and id:
		if (!isset($json['units'])){
		print_response([], "missing_units" );
		
		die;
		}
	
		if (!isset($json['id'])){
		print_response([], "missing_id" );
		
		die;
		}
	
		# Make sure our id is under 24 characters:
		$id = $json['id'];
		if (strlen($id) > 24)
			$id = substr($id,24);
		
		
		# Form our SQL request string:
		$template_3 = "INSERT INTO `units`(id, dave, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49) VALUES (:id, :dave, :1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11, :12, :13, :14, :15, :16, :17, :18, :19, :20, :21, :22, :23, :24, :25, :26, :27, :28, :29, :30, :31, :32, :33, :34, :35, :36, :37, :38, :39, :40, :41, :42, :43, :44, :45, :46, :47, :48, :49) ON DUPLICATE KEY UPDATE units = GREATEST(units, VALUES(units))";
		
		#prepare and send the request to the DB:
		$sth = $pdo -> prepare($template_3);
		$sth -> execute(["id" => $id, "units" => $json['units']]);
		
		#Print back an empty response saying there was no issue:
		print_response();
		
		die;
	
	break;
	
	# Handel invalid requests:
	default:
		print_response([], "invalid_command");
		die;
	}
	#}