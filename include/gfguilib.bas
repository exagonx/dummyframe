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

#include "gfbutton.bas"
#include "gfmenu.bas"
#include "gfwindow.bas"

sub  GFGUI.P_UNDERLINE(byval XPosition as integer, byval YPosition as integer, byval Text as string, byval TextColor as integer) export
	dim as string StringText = ""
	dim as integer Cle = 0, ECle = 1, ULPos = 0, FC  = 0
	
	'Draw string with underlined char where the first one after the & simbol
	do 
		Cle = Cle + 1
		if mid(Text,Cle,1) = "&" then 
			ULPos = Cle
			StringText = StringText & mid(Text,(Cle +1), (len(Text) - 1))
			FC = 4
			ECle = 0
		else
			StringText = StringText & mid(Text,Cle,1)
		end if
		if Cle = len(Text) then ECle = 0
		  
	loop while ECle = 1 
	
	
	
	Draw String (XPosition - FC, YPosition), StringText, TextColor
	if FC > 0 then
		line (XPosition - FC + (8 * ULPos - 8),YPosition + 9)-(XPosition - FC + (8 * ULPos ),YPosition + 9),TextColor
	end if
	
end sub


sub GFGUI.P_SQUARE(byval XStart as integer, byval YStart as integer, byval PWidth as integer, byval PHeight as integer, byval BGColor as integer, byval BordColor as integer, byval Modal as integer) export
	dim as integer BH, BW
	dim as integer CBU, CBD, CBL, CBR 
	
	'Read and assign default color to the 3D bars
	if this.ColBarUp > 0 then CBU = this.ColBarUp else CBU = 15
	if this.ColBarDown > 0 then CBD = this.ColBarDown else CBD = 8
	if this.ColBarLeft > 0 then CBL = this.ColBarLeft else CBL = 15
	if this.ColBarRight > 0 then CBR = this.ColBarRight else CBR = 8
	

	 
	
	if this.BorderHeight > 0 and this.BorderWidth > 0 and Modal = 1 then 
		BH = this.BorderHeight
		BW = this.BorderWidth

		'Make the Upper border 3D
		line (XStart,YStart)-(XStart+PWidth, YStart), CBU 
		line (XStart, YStart)-(XStart+BH, YStart+BH), CBU
		line (XStart+PWidth, YStart)-(XStart+PWidth-BH, YStart+BH), CBU
		line (XStart+BH,YStart+BH)-(XStart+PWidth-BH, YStart+BH), CBU
		paint (XStart+2 ,YStart+1),CBU
		
		
		'Make the Left border 3D
		line (XStart,YStart)-(XStart,YStart+PHeight),CBL
		line (XStart+BH,YStart+BH)-(XStart+BH,YStart+PHeight-BH),CBL
		line (XStart, YStart)-(XStart+BH, YStart+BH), CBL
		line (XStart,YStart+PHeight)-(XStart+BH,YStart+PHeight-BH),CBL
		paint (XStart+1 ,YStart+3),CBL
	
		'Make the Right border 3D
		line (XStart+PWidth,YStart)-(XStart+PWidth,YStart+PHeight),CBR
		line (XStart+PWidth-BH,YStart+BH)-(XStart+PWidth-BH,YStart+PHeight-BH),CBR
		line (XStart+PWidth, YStart)-(XStart+PWidth-BH, YStart+BH), CBR
		line (XStart+PWidth,YStart+PHeight)-(XStart+PWidth-BH,YStart+PHeight-BH),CBR
		paint (XStart+PWidth-1 ,YStart+2),CBR

		'Make the Bottom border 3D
		line (XStart,YStart+PHeight)-(XStart+PWidth, YStart+PHeight), CBD 
		line (XStart, YStart+PHeight)-(XStart+BH, YStart-BH+PHeight), CBD
		line (XStart+PWidth, YStart+PHeight)-(XStart+PWidth-BH, YStart+PHeight-BH), CBD
		line (XStart+BH,YStart+PHeight-BH)-(XStart+PWidth-BH, YStart+PHeight-BH), CBD
		paint (XStart+2 ,YStart+PHeight-1), CBD
	
		
	end if
	if this.BorderHeight > 0 and this.BorderWidth > 0 and Modal = 2 then
		BH = this.BorderHeight
		BW = this.BorderWidth

		'Make the Upper border 3D But exchange the CBD (bottom color ) var with the CBU ( Upper Color ) that give pressed effect
		line (XStart,YStart)-(XStart+PWidth, YStart), CBD 
		line (XStart, YStart)-(XStart+BH, YStart+BH), CBD
		line (XStart+PWidth, YStart)-(XStart+PWidth-BH, YStart+BH), CBD
		line (XStart+BH,YStart+BH)-(XStart+PWidth-BH, YStart+BH), CBD
		paint (XStart+2 ,YStart+1),CBD
		
		'Make the Upper border 3D But exchange the CBR (Right color ) var with the CBL ( Left Color ) that give pressed effect
		line (XStart,YStart)-(XStart,YStart+PHeight),CBR
		line (XStart+BH,YStart+BH)-(XStart+BH,YStart+PHeight-BH),CBR
		line (XStart, YStart)-(XStart+BH, YStart+BH), CBR
		line (XStart,YStart+PHeight)-(XStart+BH,YStart+PHeight-BH),CBR
		paint (XStart+1 ,YStart+3),CBR
		
		'Make the Upper border 3D But exchange the CBL (Left color ) var with the CBR ( Right Color ) that give pressed effect
		line (XStart+PWidth,YStart)-(XStart+PWidth,YStart+PHeight),CBL
		line (XStart+PWidth-BH,YStart+BH)-(XStart+PWidth-BH,YStart+PHeight-BH),CBL
		line (XStart+PWidth, YStart)-(XStart+PWidth-BH, YStart+BH), CBL
		line (XStart+PWidth,YStart+PHeight)-(XStart+PWidth-BH,YStart+PHeight-BH),CBL
		paint (XStart+PWidth-1 ,YStart+2),CBL
		
		'Make the Upper border 3D But exchange the CBU (Upper color ) var with the CBD ( Bottom Color ) that give pressed effect
		line (XStart,YStart+PHeight)-(XStart+PWidth, YStart+PHeight), CBU 
		line (XStart, YStart+PHeight)-(XStart+BH, YStart-BH+PHeight), CBU
		line (XStart+PWidth, YStart+PHeight)-(XStart+PWidth-BH, YStart+PHeight-BH), CBU
		line (XStart+BH,YStart+PHeight-BH)-(XStart+PWidth-BH, YStart+PHeight-BH), CBU
		paint (XStart+2 ,YStart+PHeight-1), CBU
		
	end if	
	
	if Modal <= 3 then
		line (XStart+BW,YStart+BH)-(XStart+PWidth-BW,YStart+PHeight-BH),BGColor,BF
	end if
	
end sub

function GFGUI.SET_GRAPHICS(byval Cols as integer, byval Rows as integer)as integer export

	
	dim as integer ErRet = 1
	dim as integer twid, tw, th
	
	this.ScreenWidth = Cols * 8
	this.ScreenHeight = Rows * 8	
	'16	512x384	 	64x24 or 64x48	8x16 or 8x8	256K colors to 256 attributes or direct color
	'17	640x400	 	80x25 or 80x50	8x16 or 8x8	256K colors to 256 attributes or direct color
	'18	640x480	 	80x30 or 80x60	8x16 or 8x8	256K colors to 256 attributes or direct color
	'19	800x600	 	100x37 or 100x75	8x16 or 8x8	256K colors to 256 attributes or direct color
	'20	1024x768	 	128x48 or 128x96	8x16 or 8x8	256K colors to 256 attributes or direct color
	'21	1280x1024	 	160x64 or 160x128	8x16 or 8x8	256K colors to 256 attributes or direct color
	if Cols = 64 and ( Rows = 24 or Rows = 48)then 
		ErRet = 0
		screen 16
		twid = Width()
		tw = LoWord(twid): th = HiWord(twid)
		if Rows = 24 then Width 512\8, 384\16 '' Use 8*16 font
		if Rows = 48 then Width 512\8, 384\8 '' Use 8*8 font
	end if
	if Cols = 80 and ( Rows = 25 or Rows = 50) then 
		ErRet = 0
		screen 17
		twid = Width()
		tw = LoWord(twid): th = HiWord(twid)
		if Rows = 25 then Width 640\8, 400\16 '' Use 8*16 font
		if Rows = 50 then Width 640\8, 400\8 '' Use 8*8 font
	end if
	if Cols = 80 and ( Rows = 30 or Rows = 60) then 
		ErRet = 0
		screen 18
		
		twid = Width()
		tw = LoWord(twid): th = HiWord(twid)
		
		if Rows = 30 then Width 640\8, 480\16 '' Use 8*16 font
		if Rows = 60 then Width 640\8, 480\8 '' Use 8*8 font
		
	end if
	if Cols = 100 and ( Rows = 37 or Rows = 75) then 
		
		ErRet = 0
		screen 19
		
		twid = Width()
		tw = LoWord(twid): th = HiWord(twid)
		
		if Rows = 37 then Width 800\8, 600\16 '' Use 8*16 font
		if Rows = 75 then Width 800\8, 600\8 '' Use 8*8 font
		
	end if
	if Cols = 128 and ( Rows = 48 or Rows = 96) then 
		ErRet = 0
		screen 20
		twid = Width()
		tw = LoWord(twid): th = HiWord(twid)
		
		if Rows = 48 then Width 1024\8, 768\16 '' Use 8*16 font
		if Rows = 96 then Width 1024\8, 768\8 '' Use 8*8 font
	end if
	if Cols = 160 and ( Rows = 64 or Rows = 128) then 
		ErRet = 0
		screen 21
		twid = Width()
		tw = LoWord(twid): th = HiWord(twid)
		if Rows = 64 then Width 1280\8, Rows\1024 '' Use 8*16 font
		if Rows = 128 then Width 1280\8, Rows\1024 '' Use 8*8 font
	end if
	
	if ErRet = 0 then 
	
	
	end if
	return ErRet
end function

