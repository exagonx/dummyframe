function GFMENU.GF_SET_SIZE(byval Cols as integer, byval Rows as integer)as integer export
		Dim OutErr as integer
		
		if (Cols * 8) > this.ScreenWidth then OutErr += 1
		if (Rows * 8) > this.ScreenHeight then OutErr += 1
	
return OutErr
end function

sub GFMENU.MENU_ADD(byval MenuTitle as string) export
	
	dim as integer LastMenu = 0
	dim as integer EndLoop = 0 
	
	do 
		if this.MENU_ITEM(LastMenu,0) = "" or LastMenu > 18then 
			EndLoop = 1
			
		else
			LastMenu = ( LastMenu + 1 )
		end if
				
	loop until EndLoop = 1
	
	if this.MENU_ITEM(LastMenu,0) = "" then this.MENU_ITEM(LastMenu,0) = MenuTitle
	
	
	
end sub
sub GFMENU.MENU_EDIT(byval MenuTitle as string, byval NewTitle as string) export
	dim as integer StepMenu = 0 
	dim as integer EndLoop = 0 
	
	do 
		if this.MENU_ITEM(StepMenu,0) = MenuTitle or StepMenu > 18then 
			EndLoop = 1
			
		else
			StepMenu = ( StepMenu + 1 )
		end if
				
	loop until EndLoop = 1
	if this.MENU_ITEM(StepMenu,0) = MenuTitle then this.MENU_ITEM(StepMenu,0) = NewTitle
		
end sub
sub GFMENU.MENU_DELETE(byval MenuTitle as string) export
	dim as integer StepMenu = 0 
	dim as integer EndLoop = 0 
	
	do 
		if this.MENU_ITEM(StepMenu,0) = MenuTitle or StepMenu > 18then 
			EndLoop = 1
			
		else
			StepMenu = ( StepMenu + 1 )
		end if
				
	loop until EndLoop = 1
	if this.MENU_ITEM(StepMenu,0) = MenuTitle then this.MENU_ITEM(StepMenu,0) = ""
		
end sub
sub GFMENU.SUBMENU_ADD(byval MenuTitle as string, byval SUBMenuTitle as string) export
	dim as integer StepMenu = 0 
	dim as integer EndLoop = 0 
	dim as integer SelectMenu = 0
	
	do 
		if this.MENU_ITEM(StepMenu,0) = MenuTitle or StepMenu > 19then
			
			EndLoop = 1
			
		else
			StepMenu = ( StepMenu + 1 )
		end if
				
	loop until EndLoop = 1
	if StepMenu < 20 then SelectMenu = StepMenu
	'print this.MENU_ITEM(SelectMenu,0) & "="  & MenuTitle & " add: " & SUBMenuTitle
	if this.MENU_ITEM(StepMenu,0) = MenuTitle then 
		'print "--------------"
		StepMenu = 0
		EndLoop = 0
		do 
			if len(this.MENU_ITEM(SelectMenu,StepMenu)) < 1 or StepMenu > 19then 
				
				EndLoop = 1
			
			else
				'print "--------------" & this.MENU_ITEM(SelectMenu,StepMenu)
				StepMenu = ( StepMenu + 1 )
			end if
				
		loop until EndLoop = 1
		this.Debug = StepMenu
		
	end if
	if len(this.MENU_ITEM(SelectMenu,StepMenu)) < 1 then 
		this.MENU_ITEM(SelectMenu, StepMenu) = SUBMenuTitle
	end if	
	'print "step = " & this.MENU_ITEM(SelectMenu, StepMenu)
	'sleep

end sub
sub GFMENU.SUBMENU_EDIT(byval MenuTitle as string, byval SUBMenuTitle as string, byval SUBMenuNewTitle as string) export
	dim as integer StepMenu = 0 
	dim as integer EndLoop = 0 
	dim as integer SelectMenu = 0
	
	do 
		if this.MENU_ITEM(StepMenu,0) = MenuTitle or StepMenu > 19 then 
			EndLoop = 1
			
		else
			StepMenu = ( StepMenu + 1 )
		end if
				
	loop until EndLoop = 1
	if this.MENU_ITEM(StepMenu,0) = MenuTitle then 
		SelectMenu = StepMenu
		do 
		if this.MENU_ITEM(SelectMenu,StepMenu) = SUBMenuTitle or StepMenu > 19 then 
			EndLoop = 1
			
		else
			StepMenu = ( StepMenu + 1 )
		end if
				
		loop until EndLoop = 1
		if this.MENU_ITEM(SelectMenu,StepMenu) = SUBMenuTitle then this.MENU_ITEM(SelectMenu,StepMenu) = SUBMenuNewTitle
	end if
	

end sub
sub GFMENU.SUBMENU_DELETE(byval MenuTitle as string, byval SUBMenuTitle as string) export
	dim as integer StepMenu = 0 
	dim as integer EndLoop = 0 
	dim as integer SelectMenu = 0
	
	do 
		if this.MENU_ITEM(StepMenu,0) = MenuTitle or StepMenu > 19 then 
			EndLoop = 1
			
		else
			StepMenu = ( StepMenu + 1 )
		end if
				
	loop until EndLoop = 1
	if this.MENU_ITEM(StepMenu,0) = MenuTitle then 
		SelectMenu = StepMenu
		do 
		if this.MENU_ITEM(SelectMenu,StepMenu) = SUBMenuTitle or StepMenu > 19 then 
			EndLoop = 1
			
		else
			StepMenu = ( StepMenu + 1 )
		end if
				
		loop until EndLoop = 1
		if this.MENU_ITEM(SelectMenu,StepMenu) = SUBMenuTitle then this.MENU_ITEM(SelectMenu,StepMenu) = ""
	end if
	

end sub

sub GFMENU_M_HOVER() export

end sub

sub GFMENU.MENU_SHOW(byval XHover as integer, byval ItemLenght as integer, byval MOption as integer ) export
	dim as integer XPos, YPos, MWid, MHei, BGC, BHe, BBg, Bor, TC, STC, SMax, HBG
	dim as integer CharColor, StringLen
	dim LocalXPosition as integer
	dim LocalYPosition as integer
	
	dim as integer DiVo = 0, StepVo = 0
	
	XPos = this.XPosition
	YPos = this.YPosition
	MWid = this.Menu_Width
	MHei = this.Menu_Height
	
	if this.M_BorderColor > -1 then Bor = this.M_BorderColor else Bor = 15
	if this.M_BGColor > -1 then BGC = this.M_BGColor else BGC = 8
	if this.M_TextColor > -1 then TC = this.M_TextColor else TC = 15
	if this.M_HoverTextColor > -1  then STC = this.M_HoverTextColor else STC = 0
	if this.M_HoverBGColor > -1 then HBG = this.M_HoverBGColor else HBG = 7

	this.P_SQUARE(XPos, YPos, MWid, MHei, Bor,0,0)	
	this.P_SQUARE(XPos + 1, YPos + 1, MWid - 2, MHei - 2, BGC,0,1)
	

	do
		if this.MENU_ITEM(StepVo,0) <> "" then 
			LocalXPosition = XPos + 9
			LocalYPosition = YPos + 5
			
					
			XPos = ( XPos + (len(this.MENU_ITEM(StepVo,0)) * 8) + (8*2))
			
			SMax = LocalXPosition + len(this.MENU_ITEM(StepVo,0)) * 8
			
			StringLen =  len(this.MENU_ITEM(StepVo,0)) * 8
			if MOption = 1 and  XHover > LocalXPosition  and XHOver < SMax then 
				'locate 21,15: print "HOVER" & SMax
				CharColor = STC
				this.SMouseOut = LocalXPosition -9
				this.EMouseOut = (LocalXPosition -9) + StringLen
				
				this.P_SQUARE(LocalXPosition - 9, YPos + 1, StringLen , MHei - 2, HBG,0,1)
								
				this.SelectedMenu = this.MENU_ITEM(StepVo,0)
				this.SMX_StartPosition = LocalXPosition - 9
				this.SMY_StartPosition = YPos + MHei
								
				 
			else
				CharColor = TC
			end if
			this.P_UNDERLINE(LocalXPosition, LocalYPosition, this.MENU_ITEM(StepVo,0), CharColor)
			
		end if
				
		StepVo = StepVo + 1
		
		
	loop while StepVo < 20 
	
	
	
	'locate 18,10:print "XPosition =" & this.XPosition & "  YPosition =" & this.YPosition & "  Width = " & this.Menu_Width

end sub

function GFMENU.HANDLER()as integer export
	dim as integer CurrentX, CurrentY, MouseButtons, FeedBack = 0
	
	dim as integer RenSkip = 0
	
	'XPos = this.XPosition
	'YPos = this.YPosition
	'MWid = this.Menu_Width
	'MHei = this.Menu_Height
	
	
	GetMouse CurrentX, CurrentY, , MouseButtons
	
	
	If MouseButtons = 1 Then
		
		If CurrentY >= this.YPosition And CurrentY <= ( this.YPosition + this.Menu_Height ) and CurrentX >= this.XPosition And CurrentX <= ( this.XPosition + this.Menu_Width ) Then
			'locate 19,15: print "Hover CX=" & CurrentX & " StartX = " & this.XPosition & " Current Y =" & CurrentY & "Start Y = " & this.XPosition & "MaxY = " & this.YPosition + this.Menu_Height & "     "
			if this.M_Refresh <> 1 then 
				
				this.MENU_SHOW(CurrentX,0,2)
				this.M_Refresh = 1
				this.M_ClickDown = 1
			end if
				
			
		end if
	else 
	
		If CurrentY >= this.YPosition And CurrentY <= ( this.YPosition + this.Menu_Height ) and CurrentX >= this.XPosition And CurrentX <= ( this.XPosition + this.Menu_Width ) Then
		
		'locate 19,15: print "Hover CX=" & CurrentX & " StartX = " & this.XPosition & " Current Y =" & CurrentY & "Start Y = " & this.XPosition & "MaxY = " & this.YPosition + this.Menu_Height & "     "
			if this.M_Refresh <> 2 then 
			
				this.MENU_SHOW(CurrentX,0,1)
				this.M_Refresh = 2
			end if
			if CurrentX < this.SMouseOut or CurrentX > EMouseOut then this.M_Refresh = 0
		else
			'locate 19,15: print "Out CX=" & CurrentX & " StartX = " & this.XPosition & " Current Y =" & CurrentY & "Start Y = " & this.XPosition & "MaxY = " & this.YPosition + this.Menu_Height & "     "
		
			if this.M_Refresh <> 3  then 
				
				this.MENU_SHOW(CurrentX,0,0)
				this.M_Refresh = 3
			
			end if
			
			if CurrentY >= this.YPosition And CurrentY <= ( this.YPosition + this.Menu_Height ) then 
				if CurrentX < this.SMouseOut or CurrentX > EMouseOut then this.M_Refresh = 0		
			end if
		end if
		
		
		
		
		
		if this.M_ClickDown = 1 then
				this.M_ClickDown = 0
				FeedBack = 1
		end if
	end if
	return FeedBack




end function
sub GFMENU.SubMenu_Open() export
	
	dim as integer CL = 0, XPos = 0, VoiceSelected = -1, SQX = 0, StepVo = 0, Bor = 0 , MSIn = 7
	dim as integer SS = 30, TotalVoices = 0, CicleM
	dim as integer SubMenuWidth = (30 *8), SubMenuHeight = 0
	dim as integer SubMenuSelected, CurrCharColor, CurrBGColor
	dim as integer SubMenuYPosMin, SubMenuYPosMax, SubMenuXPosMin, SubMenuXPosMax
	dim as string SubMenuVoice(18)
	dim as integer CurrentX, CurrentY, MouseButtons
	
	dim as integer Refresh = 0, HoldX, HoldY
	
	if this.SubMenuSS > 0 then SS = this.SubMenuSS 
	
	'this.SelectedSubMenu = ""
	StepVo  = 0
	do
	
		XPos = ( XPos + (len(this.MENU_ITEM(StepVo,0)) * 8) + (8*2))
		
		if this.MENU_ITEM(StepVo,0) = this.SelectedMenu then 
			VoiceSelected = StepVo
			CL = 1
		end if
		StepVo = StepVo + 1
		if StepVo > 18 then CL = 1
	
	loop while CL = 0
	StepVo = 1
	TotalVoices = 0
	CL = 0
	do
		if len(this.MENU_ITEM(VoiceSelected,StepVo)) > 0  then 
			'locate 20 + TotalVoices,20: print this.MENU_ITEM(VoiceSelected,StepVo)
			SubMenuVoice(StepVo -1) = this.MENU_ITEM(VoiceSelected,StepVo)
			TotalVoices = TotalVoices + 1
			
		end if
		if StepVo > 18 then CL = 1
		StepVo= StepVo + 1
		
	loop while CL = 0
	'print StepVo
	'this.P_SQUARE(XPos, YPos, MWid, MHei, Bor,0,0)	
	'this.P_SQUARE(XPos + 1, YPos + 1, MWid - 2, MHei - 2, BGC,0,1)
	
	'this.P_UNDERLINE(LocalXPosition, LocalYPosition, this.MENU_ITEM(StepVo,0), CharColor)
	SubMenuHeight = ( TotalVoices * 8 ) + 8
	CL = 0
	

	'locate 20,30:print "Items number:" & TotalVoices 
	SubMenuSelected = 0
	do
		GetMouse CurrentX, CurrentY, , MouseButtons
		If MouseButtons = 1 Then
			if CurrentX > this.SMX_StartPosition and CurrentY > this.SMY_StartPosition and CurrentX < SubMenuWidth + this.SMX_StartPosition and CurrentY < this.SMY_StartPosition + SubMenuHeight + (TotalVoices * 8) then 
				CL = 1
				this.SelectedSubMenu = SubMenuVoice(SubMenuSelected)
			else
				this.SelectedSubMenu = ""
				CL = 1
			end if
			
		else
		
		end if
		
		
		
		if HoldX <> CurrentX then 
			Refresh = 0
			HoldX  = CurrentX
		end if
		
		if HoldY <> CurrentY then 
			Refresh = 0
			HoldY = CurrentY
		end if
		
		if Refresh = 0 then
			this.P_SQUARE(this.SMX_StartPosition, this.SMY_StartPosition, SubMenuWidth, SubMenuHeight + (TotalVoices * 8), Bor,0,0)	
			this.P_SQUARE(this.SMX_StartPosition +1, this.SMY_StartPosition +1, SubMenuWidth -2, SubMenuHeight + (TotalVoices * 8) -2 , MSIn,0,0)	
			
			for CicleM = 0 to TotalVoices step 1
						
						' Retrive the Menu coordinates for make the correct square for the menu string
						
						SubMenuYPosMin = this.SMY_StartPosition + (CicleM * 16) + 0
						SubMenuYPosMax = this.SMY_StartPosition + (CicleM * 16) + 16
						SubMenuXPosMin = this.SMX_StartPosition + 8 
						SubMenuXPosMax =  this.SMX_StartPosition + 8 + SubMenuWidth 'SubMenuHeight + (TotalVoices * 8) -2
						
					if CurrentX > SubMenuXPosMin and CurrentY > SubMenuYPosMin and CurrentX < SubMenuXPosMax and CurrentY < SubMenuYPosMax then
						SubMenuSelected = CicleM
						'debug code for write the coordinates
						'locate 20,10: print "SubMenuYPosMin = " & SubMenuYPosMin & " SubMenuYPosMax = " & SubMenuYPosMax & "    "
						'locate 21,10: print "SubMenuXPosMin = " & SubMenuXPosMin & " SubMenuXPosMax = " & SubMenuXPosMax & "    "
					else 
						
					end if

				
				if len (SubMenuVoice(CicleM) ) > 0 then 
					
					

					 ' if selected invert color of background and char
					if SubMenuSelected = CicleM then 
						CurrCharColor = MSIn 
						CurrBGColor = Bor
					else 
						CurrCharColor = Bor
						CurrBGColor = MSIn
					end if
					
					' draw and write the selected and unselected menu string
					this.P_SQUARE(this.SMX_StartPosition + 2 , this.SMY_StartPosition + (CicleM * 16) + 2, SubMenuWidth - 4, 14 , CurrBGColor,0,0)	
					this.P_UNDERLINE(this.SMX_StartPosition + 8 , this.SMY_StartPosition + (CicleM * 16) + 4, SubMenuVoice(CicleM), CurrCharColor)
				end if
			next CicleM
			Refresh = 1
		end if
		
		if inkey = chr(27) then CL = 1
		sleep 1
	loop while CL = 0
	
end sub
