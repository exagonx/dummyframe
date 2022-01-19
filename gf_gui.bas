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
	cls
	MainArea.W_DESIGN()
	MainWindow.W_DESIGN()
	ButtonClose.B_Show()
	ButtonCancel.B_Show()
	MainMenu.MENU_SHOW(0,0,0)
	
end sub


SetMouse 1, 1, 1

Repaint()

Do	
	if Area = "exit" then 
		if ButtonClose.B_HANDLER() = 1 then exit do
		if ButtonCancel.B_HANDLER() = 1 then 
			ButtonCancel.B_Show()
			SubWindow.W_DESIGN()
			ButtonCloseSub.B_Show()
			Area = "sub"
		end if

		if MainWindow.W_BAR_HANDLER() = 2 then
			ButtonClose.XPosition = MainWindow.ChildXPosition(0,0) 'X Window container moveable
			ButtonClose.YPosition = MainWindow.ChildYPosition(0,0) 'Y Window container moveable
			ButtonCancel.XPosition = MainWindow.ChildXPosition(1,0) 'X Window container moveable
			ButtonCancel.YPosition = MainWindow.ChildYPosition(1,0) 'Y Window container moveable
			Repaint()
			
		end if
		
		if MainMenu.HANDLER() = 1 then 
			'print MainMenu.Debug
			MainMenu.SubMenu_Open()
			if MainMenu.SelectedSubMenu = "E&xit" then exit do
			Repaint()
		end if
			
	end if
	
	if Area = "sub" then 
	
		if ButtonCloseSub.B_HANDLER() = 1 then 
			Area = "exit"
			Repaint()
		end if
		
		if SubWindow.W_BAR_HANDLER() = 2 then
			
			ButtonCloseSub.XPosition = SubWindow.ChildXPosition(0,0)   'X Window container moveable
			ButtonCloseSub.YPosition = SubWindow.ChildYPosition(0,0)   'Y Window container moveable
			Repaint()
			SubWindow.W_DESIGN()
			ButtonCloseSub.B_Show()
			
					
		end if
	
	end if
	
	sleep 1
Loop While Inkey = ""	




