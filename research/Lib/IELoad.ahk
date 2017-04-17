IELoad(Pwb)	;You need to send the IE handle to the function unless you define it as global.
{
	If !Pwb	;If Pwb is not a valid pointer then quit
		Return False
	Loop	;Otherwise sleep for .1 seconds untill the page starts loading
		Sleep,100
	Until (Pwb.busy)
	Loop	;Once it starts loading wait until completes
		Sleep,100
	Until (!Pwb.busy)
	Loop	;optional check to wait for the page to completely load
		Sleep,100
	Until (Pwb.Document.Readystate = "Complete")
	Return True
}