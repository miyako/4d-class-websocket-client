Class extends Binance_WSC_Controller

Class constructor()
	
	Super:C1705()
	
Function onError($socket : 4D:C1709.WebSocket; $error : cs:C1710._Error)
	
	//MARK:On Unloadの後にエラーが発生した場合はFormが存在しないので
	If (Form:C1466#Null:C1517)
		Form:C1466.info.error:=$error
		Form:C1466.Binance.socket.status:=Form:C1466.Binance.socket.status
	End if 
	
Function onTerminate($socket : 4D:C1709.WebSocket; $terminate : cs:C1710._Terminate)
	
	//MARK:On Unloadの後にエラーが発生した場合はFormが存在しないので
	If (Form:C1466#Null:C1517)
		Form:C1466.info.terminate:=$terminate
		Form:C1466.update()
	End if 