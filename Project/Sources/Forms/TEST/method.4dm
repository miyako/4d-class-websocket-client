$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)  // && (Not(OB Is empty(Form)))
		
		Form:C1466.onLoad()
		
	: ($event.code=On Unload:K2:2) && (Not:C34(OB Is empty:C1297(Form:C1466)))
		
		//Form.unsubscribe()
		
End case 