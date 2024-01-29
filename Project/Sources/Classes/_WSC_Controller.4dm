property dataType : Text
property headers : Object

Class constructor()
	
	This:C1470.headers:={}
	This:C1470.dataType:="text"
	
Function onMessage($socket : 4D:C1709.WebSocket; $message : cs:C1710._Message)
	
Function onError($socket : 4D:C1709.WebSocket; $error : cs:C1710._Error)
	
Function onTerminate($socket : 4D:C1709.WebSocket; $terminate : cs:C1710._Terminate)
	
Function onOpen($socket : 4D:C1709.WebSocket; $open : cs:C1710._Open)
	