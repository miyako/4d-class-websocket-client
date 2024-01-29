Class extends _WSC

property data : Object
property stream : Object

Class constructor($streams : Collection; $controller : cs:C1710._WSC_Controller)
	
	If ($streams#Null:C1517) && ($streams.length#0)
		
		$endpoint:="wss://stream.binance.com:443"
		$endpoint+="/stream?streams="+$streams.join("/")
		
		Case of 
			: (OB Instance of:C1731($controller; OB Class:C1730(cs:C1710._WSC_Controller)))
				Super:C1705($endpoint; $controller)
			Else 
				Super:C1705($endpoint; cs:C1710.Binance_WSC_Controller)
		End case 
		
		This:C1470.data:={}
		This:C1470.stream:={}
		
	End if 