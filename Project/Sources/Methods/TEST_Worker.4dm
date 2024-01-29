//%attributes = {"invisible":true,"preemptive":"capable"}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	//MARK:ストリーム受信を続けるためにワーカーで実行する
	CALL WORKER:C1389("Binance"; Current method name:C684; {})
	
Else 
	
	$channels:=New collection:C1472(\
		"adausdt@ticker"; \
		"algousdt@ticker"; \
		"bnbusdt@ticker"; \
		"btcusdt@ticker"; \
		"dotusdt@ticker"; \
		"ethusdt@ticker"; \
		"solusdt@ticker"; \
		"xrpusdt@ticker"; \
		"trxusdt@ticker")
	
	$instance:=cs:C1710.Binance.new($channels)
	
End if 