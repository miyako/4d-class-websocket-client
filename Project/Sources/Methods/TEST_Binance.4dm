//%attributes = {"preemptive":"capable"}
#DECLARE($params : Object)

If (Count parameters:C259=0)
	
	CALL WORKER:C1389(1; Current method name:C684; {})
	
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
	
	$form:=cs:C1710._BinanceForm.new($channels)
	
End if 