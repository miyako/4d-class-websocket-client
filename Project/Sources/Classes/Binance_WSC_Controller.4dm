Class extends _WSC_Controller

Class constructor()
	
	Super:C1705()
	
Function onMessage($socket : 4D:C1709.WebSocket; $message : cs:C1710._Message)
	
	If ($socket.dataType="text")
		
		$instance:=This:C1470.instance
		
		var $data; $stream : Object
		
		$data:=$instance.data
		$instance.stream:=JSON Parse:C1218($message.data; Is object:K8:27)
		
		$stream:=$instance.stream
		
		var $id : Collection
		
		$id:=Split string:C1554($stream.stream; "@"; sk trim spaces:K86:2)
		
		var $name; $api : Text
		
		$name:=$id[0]
		$api:=$id[1]
		
		var $element; $attribute : Object
		
		$element:=$data[$name]=Null:C1517 ? {} : $data[$name]
		$attribute:=$element[$api]=Null:C1517 ? {} : $element[$api]
		$attribute:=$stream.data
		$element[$api]:=$attribute
		$data[$name]:=$element
		
/*
$data.data.a  // Best ask price
$data.data.A  // Best ask quantity
$data.data.b  // Best bid price
$data.data.B  // Best bid quantity
$data.data.c  // Last price
$data.data.C  // Statistics close time
$data.data.e  // Event type
$data.data.E  // Event time
$data.data.F  // First trade ID
$data.data.h  // High price
$data.data.L  // Last trade Id
$data.data.l  // Low price
$data.data.n  // Total number of trades
$data.data.O  // Statistics open time
$data.data.o  // Open price
$data.data.p  // Price change
$data.data.P  // Price change percent
$data.data.Q  // Last quantity
$data.data.q  // Total traded quote asset volume
$data.data.s  // Symbol
$data.data.v  // Total traded base asset volume
$data.data.w  // Weighted average price
$data.data.x  // First trade(F)-1 price (first trade before the 24hr rolling window)
*/
		
	End if 
	
Function onTerminate($socket : 4D:C1709.WebSocket; $terminate : cs:C1710._Terminate)
	
	KILL WORKER:C1390