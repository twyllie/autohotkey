IELoad(Pwb)	;You need to send the IE handle to the function unless you define it as global.
{
	If !Pwb	;If Pwb is not a valid pointer then quit
		Return False
	Loop	;Otherwise sleep for .25 seconds untill the page starts loading
		Sleep,250
	Until (Pwb.busy)
	Loop	;Once it starts loading wait until completes
		Sleep,250
	Until (!Pwb.busy)
	Loop	;optional check to wait for the page to completely load
		Sleep,1000
	Until (!Pwb.busy)
	Return True
}
