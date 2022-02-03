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

sub GFTEXT.TEXT_LABEL(byval StringText as string = "")export
	dim as integer TextColor
	dim Bold as integer
	dim ReSText as string
	
	if len(StringText) < 1 then StringText = this.TEXT_STRING
	
	dim as integer MaxLeng = 0, Spre = 0
	
	MaxLeng = ((this.text_Width - ( this.text_Width mod 8) / 8))
	
	if this.Text_Color > -1 then TextColor = this.Text_Color else TextColor =  0
		
	if len(StringText) > MaxLeng then
		ReSText = left(StringText,MaxLeng)
	else
		ReSText = StringText
	end if	
	
	
	Draw String (XPosition , YPosition), ReSText, TextColor
end sub

function GFTEXT.TEXT_BOX()as integer export
	'dim as integer XPosition = 0, YPosition = 0
	'dim as integer text_Width = 0, text_Height = 0
	'redim DocBuffer(0 To 99, 0 to 20) as string
	'redim CopyBuffer(0 To 99, 0 to 20) as string
	dim KeyAction as integer
	
	
	return KeyAction
end function
function GFTEXT.EXPAND_BUFFER(byval Pages as integer, byval Rows as integer)as integer export
	dim CicleT as integer 'Pages
	dim CicleR as integer 'Rows
	dim WRValue as integer
	
	if Pages > this.MaxPages and Rows >= this.MaxRows then
	
		'Copy from Buffer to Backup
		for CicleT = 0 to this.MaxPages step 1
			for CicleR = 0 to this.MaxRows step 1
				this.CopyBuffer(CicleT, CicleR) = this.DocBuffer(CicleT, CicleR)
			next CicleR
		next CicleT
		
		' Resize the Buffer Array
		redim this.DocBuffer(0 To Pages, 0 to Rows) as string 
	
		'Restore from Backup to the Buffer
		for CicleT = 0 to this.MaxPages step 1
			for CicleR = 0 to this.MaxRows step 1
				this.DocBuffer(CicleT, CicleR) = this.CopyBuffer(CicleT, CicleR)
			next CicleR
		next CicleT
		
		' Resize Backup Array
		redim this.CopyBuffer(0 To Pages, 0 to Rows) as string 
		
		' Store new Value
		if this.MaxPages < Pages then this.MaxPages = Pages
		if this.MaxRows < Rows  then this.MaxRows = Rows
		
		WRValue = 0 'All done fine
	else
		WRValue = 1 'Value not match
	end if
	
	
	
	return WRValue
end function
