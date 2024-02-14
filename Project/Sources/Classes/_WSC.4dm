property socket : 4D:C1709.WebSocket
property controller : cs:C1710._WSC_Controller

Class constructor($url : Text; $controller : 4D:C1709.Class; $dataType : Text)
	
	If (OB Instance of:C1731($controller; OB Class:C1730(cs:C1710._WSC_Controller)))
		
		$dataType:=["text"; "blob"; "object"].indexOf($dataType)#-1 ? $dataType : "text"
		
		This:C1470.controller:=$controller.new($dataType)
		
		This:C1470.socket:=4D:C1709.WebSocket.new($url; This:C1470.controller)
		
		This:C1470.controller.instance:=This:C1470
		
	End if 