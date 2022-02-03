' GUI Manager Class 
' Version 1.2016.02.01 (Beta)
' Created by Graziano Falcone
' FreeBASIC Compiler 1.8
' E-Mail exagonx@gmail.com
' 
'    This program is free software: you can redistribute it and/or modify
'    it under the terms of the GNU General Public License as published by
'    the Free Software Foundation, either version 3 of the License, or
'    (at your option) any later version.
'
'    This program is distributed in the hope that it will be useful,
'    but WITHOUT ANY WARRANTY; without even the implied warranty of
'    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'    GNU General Public License for more details.
'
'    You should have received a copy of the GNU General Public License
'    along with this program.  If not, see <http://www.gnu.org/licenses/>.


type GFGUI
	
	dim as integer GRF
	static ScreenWidth as integer
	static ScreenHeight as integer
	
	dim as integer BorderWidth, BorderHeight
	dim as integer ColBarUp = 0, ColBarDown = 0, ColBarLeft = 0, ColBarRight = 0
	dim as integer ButtonColor = 0, ButtonTextColor = 0
	
	declare sub P_SQUARE(byval XStart as integer, byval YStart as integer, byval PWidth as integer, byval PHeight as integer, byval BGColor as integer, byval BordColor as integer, byval Modal as integer)
	declare sub P_UNDERLINE(byval XPosition as integer, byval YPosition as integer, byval Text as string, byval TextColor as integer)
	
	declare function SET_GRAPHICS(byval Cols as integer, byval Rows as integer)as integer
end type

type GFBUTTON extends GFGUI 
	dim as integer XPosition, YPosition
	dim as integer Button_Width, Button_Height
	dim as integer Button_BGColor_Normal, Button_BGColor_Hover, Button_BGColor_Click
	dim as integer B_ButtonDown = 0, B_Refresh = 0
	
	dim as string Button_Text
	
	
	declare sub P_BUTTON(byval XStart as integer, byval YStart as integer, byval PWidth as integer, byval PHeight as integer, byval Text as string, byval Active as integer)	
	declare sub B_Show()
	declare sub B_Click()
	declare sub B_Hover()
	
	declare function B_HANDLER()as integer
end type
type GFWINDOW extends GFGUI
	dim as integer XPosition = 0, YPosition = 0
	dim as integer XPCurrPos = 0, YPCurrPos = 0, YMovePos = 0, XMovePos = 0
	
	dim as integer ChildXPosition(10,2)
	dim as integer ChildYPosition(10,2)
	
	dim as integer Window_Width = 0, Window_Height = 0
	dim as integer W_BGColor = -1, W_TextColor = -1, W_BarBGColor = -1, W_BarTextColor = -1, W_BarHeigth = -1, W_BorderColor = -1
	dim as string Window_Name = "", W_Description = ""
	
	declare sub W_DESIGN()
	
	declare function W_BAR_HANDLER()as integer 
	declare function REL_POSITION(byval Question as string)as integer
	
end type 
type GFMENU extends GFGUI
	dim as string MENU_ITEM(20,20)
	
	dim as string MENU_NAME = ""
	dim as integer MAXCOL, MAXROW, Debug
	
	
	dim as integer XPosition = 0, YPosition = 0
	dim as integer Menu_Width = 0, Menu_Height = 0
	dim as integer Menu_Open_Width = 0, Menu_Open_Height = 0, Menu_Border = 1
	dim as integer SubMenuSS = 0,SMX_StartPosition = 0, SMY_StartPosition = 0
	
	dim as integer SMouseOut, EMouseOut
	
	dim as integer M_TextColor = -1, M_HoverTextColor  = -1, M_ClickedTextColor 
	dim as integer M_HoverBGColor = -1, M_ClickedBGColor = -1, M_BGColor = -1
	dim as integer M_BorderColor = -1, M_BarHeigth = -1
	
	dim as integer M_Refresh = 0, M_ClickDown = 0
	dim as string SelectedMenu = ""
	dim as string SelectedSubMenu = ""
	
	declare sub MENU_ADD(byval MenuTitle as string)
	declare sub MENU_EDIT(byval MenuTitle as string, byval NewTitle as string)
	declare sub MENU_DELETE(byval MenuTitle as string)
	declare sub SUBMENU_ADD(byval MenuTitle as string, byval SUBMenuTitle as string)
	declare sub SUBMENU_EDIT(byval MenuTitle as string, byval SUBMenuTitle as string, byval SUBMenuNewTitle as string)
	declare sub SUBMENU_DELETE(byval MenuTitle as string, byval SUBMenuTitle as string)
	
	declare sub MENU_SHOW(byval XHover as integer, byval ItemLenght as integer, byval MOption as integer )
	declare sub SubMenu_Open()
	
	
	declare function GF_SET_SIZE(byval Cols as integer, byval Rows as integer)as integer
	declare function HANDLER()as integer
end type
type GFTEXT extends GFGUI
	dim as integer XPosition = 0, YPosition = 0
	dim as integer text_Width = 0, text_Height = 0
	dim as integer Text_Color = -1
	dim as integer MaxPages = 99, MaxRows = 20
	
	dim as string TEXT_STRING
	
	redim DocBuffer(0 To 99, 0 to 20) as string
	redim CopyBuffer(0 To 99, 0 to 20) as string
	
	declare function TEXT_BOX()as integer
	declare function EXPAND_BUFFER(byval Pages as integer, byval Rows as integer)as integer
	
	declare sub TEXT_LABEL(byval StringText as string  = "")
	
end type

dim GFGUI.ScreenWidth as integer
dim GFGUI.ScreenHeight as integer

#include "gfguilib.bas"
