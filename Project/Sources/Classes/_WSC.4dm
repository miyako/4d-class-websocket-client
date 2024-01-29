property socket : 4D:C1709.WebSocket
property controller : cs:C1710._WSC_Controller

Class constructor($url : Text; $controller : 4D:C1709.Class)
	
	If (OB Instance of:C1731($controller; OB Class:C1730(cs:C1710._WSC_Controller)))
		
		This:C1470.controller:=$controller.new()
		
		This:C1470.socket:=4D:C1709.WebSocket.new($url; This:C1470.controller)
		
		//MARK:再起的な参照によりオブジェクトを延命する
		This:C1470.controller.instance:=This:C1470
		
	End if 
	