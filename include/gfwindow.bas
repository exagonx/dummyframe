sub GFWINDOW.W_DESIGN() export
	dim as integer XPos, YPos, WWid, WHei, BGC, BHe, BBg, Bor
	
	dim as integer TC = 15
	dim as integer XPosition , YPosition, StringLength
	dim as string BarText = ""
	
	if this.W_BarTextColor >-1 then TC = this.W_BarTextColor else TC = 15
	if this.W_BGColor > -1 then BGC = this.W_BGColor else BGC = 7
	if this.W_BarBGColor > -1 then BBg = this.W_BarBGColor  else BBg = 8
	if this.W_BarHeigth > -1 then BHe = this.W_BarHeigth  else BHe = 15
	if this.W_BorderColor > -1 then Bor = this.W_BorderColor else Bor = 15
	
	'assign value to vars with short name
	XPos = this.XPosition
	YPos = this.YPosition
	WWid = this.Window_Width
	WHei = this.Window_Height
	
	this.P_SQUARE(XPos, YPos, WWid, WHei, Bor,0,0)
	this.P_SQUARE(XPos + 1, YPos + 1, WWid - 2, WHei - 2, BGC,0,1)
	this.P_SQUARE(XPos + 1, YPos + 1, WWid - 2, BHe, BBg,0,1)
	
	StringLength = len(this.Window_Name)*8
	
	if StringLength > WWid then 
		BarText = Left(this.Window_Name,(WWid/8)-1)
	else
		BarText =this.Window_Name
	end if
	
	XPosition = XPos + 9
	YPosition = YPos + 5
	
	this.P_UNDERLINE(XPosition, YPosition, BarText, TC)
	

end sub
function GFWINDOW.W_BAR_HANDLER()as integer export
	dim as integer XPos, YPos, WWid, WHei, BGC, BHe, BBg, Bor, NI
	dim as integer CurrentX, CurrentY, MouseButtons, FeedBack = 0
	
	if this.W_BarHeigth > -1 then BHe = this.W_BarHeigth  else BHe = 15
	'Inside a do or a loop read the mouse position and the button action give a 1 when mouse click on the area of the button
	XPos = this.XPosition
	YPos = this.YPosition
	
	GetMouse CurrentX, CurrentY, , MouseButtons
	
	If MouseButtons = 1 Then
		if this.XPCurrPos = 0 then this.XPCurrPos = CurrentX
		if this.YPCurrPos = 0 then this.YPCurrPos = CurrentY
		
		If CurrentY >= this.YPosition And CurrentY <= ( this.YPosition + BHe ) and CurrentX >= this.XPosition And CurrentX <= ( this.XPosition + this.Window_Width ) Then
			FeedBack = 1
			
			if this.XPCurrPos > CurrentX then 
				
				this.XPosition = this.XPosition - ( this.XPCurrPos - CurrentX)
				for NI = 0 to 10 step 1
					this.ChildXPosition(NI,0) = this.ChildXPosition(NI,0) - ( this.XPCurrPos - CurrentX)
				next NI
				this.XMovePos= this.XPCurrPos - CurrentX
				this.XPCurrPos = CurrentX
				FeedBack = 2
			end if
			if this.XPCurrPos < CurrentX then 
				
				this.XPosition = this.XPosition + (CurrentX - this.XPCurrPos )
				for NI = 0 to 10 step 1
					this.ChildXPosition(NI,0) = this.ChildXPosition(NI,0) + ( CurrentX - this.XPCurrPos)
				next NI
				this.XMovePos= CurrentX - this.XPCurrPos
				this.XPCurrPos = CurrentX
				FeedBack = 2
			end if
			if this.YPCurrPos > CurrentY then 
				
				this.YPosition = this.YPosition - ( this.YPCurrPos - CurrentY)
				for NI = 0 to 10 step 1
					this.ChildYPosition(NI,0) = this.ChildYPosition(NI,0) - ( this.YPCurrPos - CurrentY)
				next NI
				this.YMovePos= this.YPCurrPos - CurrentY
				this.YPCurrPos = CurrentY
				FeedBack = 2
			end if
			if this.YPCurrPos < CurrentY then 
				
				this.YPosition = this.YPosition + (CurrentY - this.YPCurrPos )
				for NI = 0 to 10 step 1
					this.ChildYPosition(NI,0) = this.ChildYPosition(NI,0) + ( CurrentY - this.YPCurrPos)
				next NI
				this.YMovePos= CurrentY - this.YPCurrPos
				this.YPCurrPos = CurrentY
				FeedBack = 2
			end if

		end if
	else
		this.XPCurrPos = 0
		this.YPCurrPos = 0
	end if
	
	return FeedBack
end function
function GFWINDOW.REL_POSITION(byval Question as string)as integer export	
	dim Answer as integer
	dim BHe as integer
	
	if this.W_BarHeigth > -1 then BHe = W_BarHeigth else BHe = 15
	
	if UCASE(Question) = "XPOSITION" then Answer = this.XPosition + 1 
	if UCASE(Question) = "YPOSITION" then Answer = this.YPosition + ( BHe + 1 )
	if UCASE(Question) = "WIDTH" then Answer =  ( Window_Width - 1 )
	if UCASE(Question) = "HEIGHT" then Answer = ( Window_Height - 1 )
	
	return Answer
end function
	
