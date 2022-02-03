#include "include\gfgui.bi"

dim Area as string
dim Nll as integer
dim test as GFMENU


Nll = test.SET_GRAPHICS(128, 96)

dim shared MainWindow as GFWINDOW 
dim shared SubWindow as GFWINDOW 
dim shared MainArea as GFWINDOW 


dim shared ButtonClose as GFBUTTON 
dim shared ButtonCancel as GFBUTTON 
dim shared ButtonCloseSub  as GFBUTTON 

dim shared MainMenu as GFMENU

dim shared Edit as GFTEXT
dim shared Label1 as GFTEXT
dim shared Label2 as GFTEXT

dim shared InfoWindow as GFWINDOW
dim shared InfoOkClose as GFBUTTON
dim shared DescriptionLabelR1 as GFTEXT 
dim shared DescriptionLabelR2 as GFTEXT 
dim shared DescriptionLabelR3 as GFTEXT 



'Info Window design
	dim as integer InfoWidth = (170 * 2), InfoHeight = (50 * 2)
	dim as integer XCenter = (test.ScreenWidth / 2 ), YCenter = (test.ScreenHeight / 2)
	dim as string InfoRow1 = "This is a demo of how use the function"
	dim as string InfoRow2 = "Writed by ExagonX in FreeBASIC"
	dim as string InfoRow3 = "Version 2022.01.30.00032"
	
	InfoWindow.XPosition = XCenter - (InfoWidth / 2)
	InfoWindow.YPosition = YCenter - (InfoHeight / 2)
	InfoWindow.Window_Width = InfoWidth
	InfoWindow.Window_Height = InfoHeight
	InfoWindow.Window_Name = "About DEMO"
	
	' Label'
		'ROW 1
		DescriptionLabelR1.XPosition = InfoWindow.XPosition + (((InfoWidth ) - ( LEN(InfoRow1) * 8 )) / 2)
		DescriptionLabelR1.YPosition = InfoWindow.YPosition + 20 
		DescriptionLabelR1.text_Width = InfoWidth - 2
		DescriptionLabelR1.text_Height = 12
		DescriptionLabelR1.TEXT_STRING = InfoRow1
		InfoWindow.ChildXPosition(0,0) = DescriptionLabelR1.XPosition
		InfoWindow.ChildYPosition(0,0) = DescriptionLabelR1.YPosition
		'End ROW 1
		'ROW 2'
		DescriptionLabelR2.XPosition = InfoWindow.XPosition + (((InfoWidth ) - ( LEN(InfoRow2) * 8 )) / 2)
		DescriptionLabelR2.YPosition = InfoWindow.YPosition + 30 
		DescriptionLabelR2.text_Width = InfoWidth - 2
		DescriptionLabelR2.text_Height = 12
		DescriptionLabelR2.TEXT_STRING = InfoRow2
		InfoWindow.ChildXPosition(1,0) = DescriptionLabelR2.XPosition
		InfoWindow.ChildYPosition(1,0) = DescriptionLabelR2.YPosition
		'End ROW 2
		'ROW 3'
		DescriptionLabelR3.XPosition = InfoWindow.XPosition + (((InfoWidth ) - ( LEN(InfoRow3) * 8 )) / 2)
		DescriptionLabelR3.YPosition = InfoWindow.YPosition + 40 
		DescriptionLabelR3.text_Width = InfoWidth - 2
		DescriptionLabelR3.text_Height = 12
		DescriptionLabelR3.TEXT_STRING = InfoRow3
		InfoWindow.ChildXPosition(2,0) = DescriptionLabelR3.XPosition
		InfoWindow.ChildYPosition(2,0) = DescriptionLabelR3.YPosition
		'End ROW 3
	' End Label'
	' Button Ok Close
	
		InfoOkClose.BorderHeight = 3
		InfoOkClose.BorderWidth = 3
		InfoOkClose.XPosition = InfoWindow.XPosition + ( (InfoWidth - 140) / 2 )
		InfoOkClose.YPosition = InfoWindow.YPosition + 60
		InfoOkClose.Button_Width = 140
		InfoOkClose.Button_Height = 27
		InfoOkClose.Button_BGColor_Hover = 15
		InfoOkClose.Button_Text = "Ok Close"
		InfoWindow.ChildXPosition(3,0) = InfoOkClose.XPosition 'X Window container moveable
		InfoWindow.ChildYPosition(3,0) = InfoOkClose.YPosition 'Y Window container moveable
	
	'End Button Ok Close
	
' end Info Window

sub Refresh_InfoWindow()
	DescriptionLabelR1.XPosition = InfoWindow.ChildXPosition(0,0)
	DescriptionLabelR1.YPosition = InfoWindow.ChildYPosition(0,0)
	DescriptionLabelR2.XPosition = InfoWindow.ChildXPosition(1,0)
	DescriptionLabelR2.YPosition = InfoWindow.ChildYPosition(1,0)
	DescriptionLabelR3.XPosition = InfoWindow.ChildXPosition(2,0)
	DescriptionLabelR3.YPosition = InfoWindow.ChildYPosition(2,0)
	InfoOkClose.XPosition = InfoWindow.ChildXPosition(3,0)
	InfoOkClose.YPosition = InfoWindow.ChildYPosition(3,0)
	
	InfoWindow.W_DESIGN()
	InfoOkClose.B_Show()
	DescriptionLabelR1.TEXT_LABEL()
	DescriptionLabelR2.TEXT_LABEL()
	DescriptionLabelR3.TEXT_LABEL()		
end sub



'Main Area design
MainArea.XPosition = 0
MainArea.YPosition = 0
MainArea.Window_Width = 1023
MainArea.Window_Height = 767
MainArea.Window_Name = "Main Area"
	
	'Main Menu design
	MainMenu.XPosition = MainArea.REL_POSITION("XPosition")
	MainMenu.YPosition = MainArea.REL_POSITION("YPosition")
	MainMenu.Menu_Width = MainArea.REL_POSITION("Width")
	MainMenu.Menu_Height = 16
	MainMenu.MENU_ADD("&File")
		MainMenu.SUBMENU_ADD("&File", "&New")
		MainMenu.SUBMENU_ADD("&File", "O&pen")
		MainMenu.SUBMENU_ADD("&File", "Voice1")
		MainMenu.SUBMENU_ADD("&File", "Voice2")
		MainMenu.SUBMENU_ADD("&File", "Voice3")
		MainMenu.SUBMENU_ADD("&File", "Voice4")
		MainMenu.SUBMENU_ADD("&File", "E&xit")
	MainMenu.MENU_ADD("&Option")
		MainMenu.SUBMENU_ADD("&Option", "Voice1")
		MainMenu.SUBMENU_ADD("&Option", "Voice2")
		MainMenu.SUBMENU_ADD("&Option", "Voice3")
		MainMenu.SUBMENU_ADD("&Option", "Voice4")
	MainMenu.MENU_ADD("&Window")
		MainMenu.SUBMENU_ADD("&Window", "Voice1")
		MainMenu.SUBMENU_ADD("&Window", "Voice2")
		MainMenu.SUBMENU_ADD("&Window", "Voice3")
		MainMenu.SUBMENU_ADD("&Window", "Voice4")
	MainMenu.MENU_ADD("&Help")
		MainMenu.SUBMENU_ADD("&Help", "Voice1")
		MainMenu.SUBMENU_ADD("&Help", "Voice2")
		MainMenu.SUBMENU_ADD("&Help", "In&fo")
	
	'end Main Menu 

'end Main Area 

'Main Window design
MainWindow.XPosition = 80
MainWindow.YPosition = 70
MainWindow.Window_Width = 400
MainWindow.Window_Height = 200
MainWindow.Window_Name = "Main Window"
'end Main Window

'Sub Window design
SubWindow.XPosition = 300
SubWindow.YPosition = 300
SubWindow.Window_Width = 200
SubWindow.Window_Height = 100
SubWindow.Window_Name = "Sub Window"
	
'end Sub Window

'Sub Window Label1
Label1.XPosition = SubWindow.XPosition + 10
Label1.YPosition = SubWindow.YPosition + 20
Label1.text_Width = 100
Label1.text_Height = 15
	SubWindow.ChildXPosition(2,0) = Label1.XPosition
	SubWindow.ChildYPosition(2,0) = Label1.YPosition
	Label1.TEXT_STRING = "Sub window message"
'end Label1

'Sub Window Label2
Label2.XPosition = MainWindow.XPosition + 10
Label2.YPosition = MainWindow.YPosition + 20
Label2.text_Width = 100
Label2.text_Height = 15
Label2.TEXT_STRING = "Click on close for exit !"
	MainWindow.ChildXPosition(2,0) = Label2.XPosition
	MainWindow.ChildYPosition(2,0) = Label2.YPosition

'end Label2



'Button Close
ButtonClose.BorderHeight = 3
ButtonClose.BorderWidth = 3
ButtonClose.XPosition = 100
ButtonClose.YPosition = 100
ButtonClose.Button_Width = 150
ButtonClose.Button_Height = 25
ButtonClose.Button_BGColor_Hover = 15
ButtonClose.Button_Text = "&Close system !"
	MainWindow.ChildXPosition(0,0) = ButtonClose.XPosition 'X Window container moveable
	MainWindow.ChildYPosition(0,0) = ButtonClose.YPosition 'Y Window container moveable
'End Button Close

'Button Close Sub
ButtonCloseSub.BorderHeight = 3
ButtonCloseSub.BorderWidth = 3
ButtonCloseSub.XPosition = 350
ButtonCloseSub.YPosition = 340
ButtonCloseSub.Button_Width = 100
ButtonCloseSub.Button_Height = 25
ButtonCloseSub.Button_BGColor_Hover = 15
ButtonCloseSub.Button_Text = "C&lose"

	SubWindow.ChildXPosition(0,0) = ButtonCloseSub.XPosition 'X Window container moveable
	SubWindow.ChildYPosition(0,0) = ButtonCloseSub.YPosition 'Y Window container moveable
'End Button Close Sub

'Button Cancel
ButtonCancel.BorderHeight = 3
ButtonCancel.BorderWidth = 3
ButtonCancel.XPosition = 300
ButtonCancel.YPosition = 100
ButtonCancel.Button_Width = 150
ButtonCancel.Button_Height = 25
ButtonCancel.Button_BGColor_Hover = 15
ButtonCancel.Button_Text = "&Sub Window"
	MainWindow.ChildXPosition(1,0) = ButtonCancel.XPosition 'X Window container moveable
	MainWindow.ChildYPosition(1,0) = ButtonCancel.YPosition 'Y Window container moveable
'End Button Cancel


Area = "exit"
sub Repaint()
	
	ButtonClose.XPosition = MainWindow.ChildXPosition(0,0) 'X Window container moveable
	ButtonClose.YPosition = MainWindow.ChildYPosition(0,0) 'Y Window container moveable
	ButtonCancel.XPosition = MainWindow.ChildXPosition(1,0) 'X Window container moveable
	ButtonCancel.YPosition = MainWindow.ChildYPosition(1,0) 'Y Window container moveable
	Label2.XPosition = MainWindow.ChildXPosition(2,0) 
	Label2.YPosition = MainWindow.ChildYPosition(2,0)
	MainArea.W_DESIGN()
	MainWindow.W_DESIGN()
	Label2.TEXT_LABEL()
	ButtonClose.B_Show()
	ButtonCancel.B_Show()
	MainMenu.MENU_SHOW(0,0,0)
	
end sub
sub mysubwindow()
	ButtonCloseSub.XPosition = SubWindow.ChildXPosition(0,0)   'X Window container moveable
	ButtonCloseSub.YPosition = SubWindow.ChildYPosition(0,0)   'Y Window container moveable
	Label1.XPosition = SubWindow.ChildXPosition(2,0) 
	Label1.YPosition = SubWindow.ChildYPosition(2,0)
	ButtonCancel.B_Show()
	SubWindow.W_DESIGN()
	ButtonCloseSub.B_Show()
	Label1.TEXT_LABEL()
			
end sub


SetMouse 1, 1, 1

Repaint()

Do	
	if Area = "exit" then 
		if ButtonClose.B_HANDLER() = 1 then exit do
		if ButtonCancel.B_HANDLER() = 1 then 
			mysubwindow()
			Area = "sub"
		end if

		if MainWindow.W_BAR_HANDLER() = 2 then
			
			Repaint()
			
		end if
		
		if MainMenu.HANDLER() = 1 then 
			'print MainMenu.Debug
			MainMenu.SubMenu_Open()
			if MainMenu.SelectedSubMenu = "E&xit" then exit do
			if MainMenu.SelectedSubMenu = "&New" then
				Repaint()
				mysubwindow()
				
				Area = "sub"
			end if
			if MainMenu.SelectedSubMenu = "In&fo" then
				Repaint()
				Refresh_InfoWindow()
				Area = "Info"
			end if
			if Area = "exit" then Repaint()
		end if
			
	end if
	
	if Area = "sub" then 
	
		if ButtonCloseSub.B_HANDLER() = 1 then 
			Area = "exit"
			Repaint()
		end if
		
		if SubWindow.W_BAR_HANDLER() = 2 then
			

			Repaint()
			mysubwindow()
			
			
					
		end if
	
	end if
	if Area = "Info" then
		if InfoOkClose.B_HANDLER() = 1 then 
			Area = "exit"
			Repaint()
		end if
					
	
		if InfoWindow.W_BAR_HANDLER() = 2 then
			Repaint()
			Refresh_InfoWindow()
		end if
	end if
	
	sleep 1
Loop While Inkey = ""	




