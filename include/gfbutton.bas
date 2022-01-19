function GFBUTTON.B_HANDLER()as integer export
	dim as integer CurrentX, CurrentY, MouseButtons, FeedBack = 0
	
	'Inside a do or a loop read the mouse position and the button action give a 1 when mouse click on the area of the button
	
	GetMouse CurrentX, CurrentY, , MouseButtons
	
	
	If MouseButtons = 1 Then
		If CurrentY >= this.YPosition And CurrentY <= ( this.YPosition + this.Button_Height ) and CurrentX >= this.XPosition And CurrentX <= ( this.XPosition + this.Button_Width ) Then
			
			if this.B_Refresh <> 1 then 
				this.B_Click()
				this.B_Refresh = 1
				this.B_ButtonDown = 1
			end if
				
			
		end if
	else 
	
		If CurrentY >= this.YPosition And CurrentY <= ( this.YPosition + this.Button_Height ) and CurrentX >= this.XPosition And CurrentX <= ( this.XPosition + this.Button_Width ) Then
		if this.B_Refresh <> 2 then 
			this.B_Hover()
			this.B_Refresh = 2
		end if
		else
			if this.B_Refresh <> 3 then 
				this.B_Show()
				this.B_Refresh = 3
			end if
			
		end if
		if this.B_ButtonDown = 1 then
				this.B_ButtonDown = 0
				FeedBack = 1
		end if
	end if
	return FeedBack
end function


sub GFBUTTON.B_Show() export
	'reduce the length of function like an alias
	this.P_BUTTON(this.XPosition, this.YPosition, this.Button_Width, this.Button_Height, this.Button_Text, 0)
end sub
sub GFBUTTON.B_Click() export
	'reduce the length of function like an alias
	this.P_BUTTON(this.XPosition, this.YPosition, this.Button_Width, this.Button_Height, this.Button_Text, 1)
end sub
sub GFBUTTON.B_Hover() export
	'reduce the length of function like an alias
	this.P_BUTTON(this.XPosition, this.YPosition, this.Button_Width, this.Button_Height, this.Button_Text, 2)
end sub

sub GFBUTTON.P_BUTTON(byval XStart as integer, byval YStart as integer, byval PWidth as integer, byval PHeight as integer, byval Text as string, byval Active as integer) export
	
	'Create the look and feel of a button with its text 
	'using the & symbol will show the preceding character underlined
	
	dim as integer BC = 7, TC = 0
	dim as integer XPosition , YPosition, StringLength
	
	if this.ButtonColor > 0 then BC = this.ButtonColor
	if this.ButtonTextColor > 0 then TC = this.ButtonTextColor
	
	' Change the color of the area on clicked or Mouse Hover
	if this.Button_BGColor_Normal > 0 and Active = 0 then BC = this.Button_BGColor_Normal
	if this.Button_BGColor_Hover > 0 and Active = 2 then BC = this.Button_BGColor_Hover
	if this.Button_BGColor_Click > 0 and Active = 1 then BC = this.Button_BGColor_Click
	
	if Active = 0  then 
		this.P_SQUARE(XStart,YStart,PWidth,PHeight,BC,0,1)
	end if
	if Active = 1  then 
		this.P_SQUARE(XStart,YStart,PWidth,PHeight,BC,0,2)
	end if
	if Active = 2  then 
		this.P_SQUARE(XStart,YStart,PWidth,PHeight,BC,0,1)
	end if
	StringLength = len(Text)*8
	
	if StringLength > PWidth then PWidth = StringLength + 2
	
	XPosition = XStart + ((PWidth - StringLength) / 2)
	YPosition = YStart + ((PHeight - 8) / 2)
	
	this.P_UNDERLINE(XPosition, YPosition, Text, TC)
	
	
end sub
