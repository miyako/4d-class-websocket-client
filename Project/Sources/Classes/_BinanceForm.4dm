Class extends _Form

property channels : Collection

Class constructor($channels : Collection)
	
	Super:C1705()
	
	This:C1470.channels:=$channels
	
	$window:=Open form window:C675("Binance")
	DIALOG:C40("Binance"; This:C1470; *)
	
Function onLoad()
	
	//MARK:Formのコンテキストでインスタンス化＝Formのコンテキストでコールバック実行）
	Form:C1466.Binance:=cs:C1710.Binance.new(This:C1470.channels; cs:C1710.BinanceUI_WSC_Controller)
	
	//MARK:オブジェクト型タブコントロール
	Form:C1466.pages:={}
	Form:C1466.pages.values:=New collection:C1472("ティッカー"; "ストリーム"; "データ"; "デバッグ")
	Form:C1466.pages.index:=0
	
	Form:C1466.info:={error: Null:C1517; terminate: Null:C1517}
	
	Form:C1466.update()
	
Function onUnload()
	
	If (Form:C1466.Binance.socket.status="Connected")
		Form:C1466.Binance.socket.terminate()
	End if 
	
	//MARK:-
	
Function update()
	
	OBJECT SET ENABLED:C1123(*; "terminate"; Form:C1466.Binance.socket.status="Connected")
	OBJECT SET ENABLED:C1123(*; "reconnect"; Form:C1466.Binance.socket.status#"Connected")
	
	Form:C1466.Binance.socket.status:=Form:C1466.Binance.socket.status
	
Function terminate()
	
	If (Form:C1466.Binance.socket.status="Connected")
		Form:C1466.Binance.socket.terminate()
	End if 
	
	return Form:C1466
	
Function reconnect()
	
	If (Form:C1466.Binance.socket.status#"Connected")
		Form:C1466.Binance:=cs:C1710.Binance.new(This:C1470.channels; cs:C1710.BinanceUI_WSC_Controller)
		Form:C1466.info.error:=Null:C1517
		Form:C1466.info.terminate:=Null:C1517
	End if 
	
	return Form:C1466
	
Function price($c : Text)->$USDT : Text
	
	$price:=Num:C11($c)
	
	If ($price=0)
		$USDT:=""
	Else 
		$USDT:=String:C10($price; "#,###,###,##0.#### USDT")
	End if 
	
Function dailyChange($p : Text)->$dailyChange : Text
	
	$change:=Num:C11($p)
	
	If ($change<0)
		$dailyChange:="<span style=\"color:red;font-weight:bold\">↙︎&nbsp;"
		$dailyChange+=String:C10($change; "#,###,###,##0.00%")
		$dailyChange+="</span>"
	Else 
		$dailyChange:="<span style=\"color:green;font-weight:bold\">↗︎&nbsp;"
		$dailyChange+=String:C10($change; "#,###,###,##0.00%")
		$dailyChange+="</span>"
	End if 