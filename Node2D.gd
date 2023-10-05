extends Node2D

#var lines = Node2D.new()
var lines = Node2D.new()
onready var lines_node = add_child(lines)
onready var brush_tip = $'%brushTip'

var pressed = false
var current_line: Line2D
var brush_color = Color.white
var brush_thickness = 5

var popup_open = false
onready var colorButton = $'%colorButton'
onready var penButton = $'%penButton'


#THIS IS THE CODE FOR DRAWING
func _draw():
	for i in range(lines.get_child_count()):
		var line = lines.get_child(i)
		draw_circle(line.points, line.default_color, line.brush_thickness)
		

#THIS IS THE CODE FOR THE INPUT
func _input(event: InputEvent) -> void:
	if !popup_open:
		if event is InputEventMouseButton and InputEventScreenTouch:
			pressed = event.pressed
		
			if pressed:
				current_line = Line2D.new()
				current_line.default_color = brush_color
				current_line.width = brush_thickness
				current_line.round_precision = brush_thickness
				lines.add_child(current_line)
				
				
			else:
				current_line = null
			
		elif event is InputEventMouseMotion and pressed and InputEventScreenDrag:
			current_line.add_point(event.position)
			
	else:
		return
		

###############################################
#FOR THE ERASER
#
func _on_eraser_button_down() -> void:
	brush_color = Color.white
	brush_thickness = $'%eraser'.value
	brush_tip.modulate = Color(brush_color)
	print("Erasing Time")
	
##############################################
#FOR THE BRUSH THICKNESS | SIZE OF THE BRUSH
func _on_HSlider_value_changed(value: float) -> void:
	brush_thickness = value
	$'%brushLabel'.text = ("Brush Size:     ") + str(value)
	$'%brush'.value = value
	print("Size Value: " + str(value))

#FOR THE ERASER THICKNESS | SIZE OF THE ERASER
func _on_eraser_value_changed(eraserValue: float) -> void:
	brush_thickness = eraserValue
	$'%eraser'.value = eraserValue
	$'%eraserSize'.text =("Eraser Size:      ") + str(eraserValue)
	print("Size Value: " + str(eraserValue))
	
###############################################
#FOR SHOWING COLOR PALETTE
#
func _on_colorButton_pressed() -> void:
	if not popup_open:
		#This will show the Panel Container
		$'%PanelContainer'.show()
		popup_open = true
		print("Show Palette")
		$'%penButton'.disabled = true
		$'%disableBrush'.show()
		print("Disabled Brush")
		$'%disableEraser'.show()
		print("Disabled Eraser")
		$'%disableText'.show()
		
func closePalette() -> void:
	$'%PanelContainer'.hide()
	popup_open = false
	print("Hide Palette")
	$'%penButton'.disabled = false
	$'%disableBrush'.hide()
	print("Enabled Color")
	$'%disableEraser'.hide()
	print("Enabled Eraser")
	$'%disableText'.hide()
	
##########################################
#For the Button Resizer

func _on_penButton_pressed() -> void:
	if not popup_open:
		$'%BrushSize'.show()
		popup_open = true
		print("Show Brush|Pen")
		$'%colorButton'.disabled = true
		$'%disableColor'.show()
		print("Disabled Color")
		$'%disableEraser'.show()
		print("Disabled Eraser")
		$'%disableText'.show()

func _on_exit_pressed() -> void:
	$'%BrushSize'.hide()
	popup_open = false
	$'%colorButton'.disabled = false
	print("Enabled Pen")
	$'%disableColor'.hide()
	$'%disableEraser'.hide()
	print("Enabled Eraser")
	$'%disableText'.hide()

###################################################
# For the Writing the Text
func _on_textButton_pressed() -> void:
	if not popup_open:
		$'%TextPanel'.show()
		popup_open = true
		$'%disableColor'.show()
		print("Disabled Color")
		$'%disableBrush'.show()
		print("Disabled Brush")
		$'%disableEraser'.show()
		print("Disabled Eraser")

func _on_exitText_pressed() -> void:
	$'%TextPanel'.hide()
	popup_open = false
	$'%disableColor'.hide()
	print("Enabled Color")
	$'%disableBrush'.hide()
	print("Enabled Brush")
	$'%disableEraser'.hide()
	print("Enabled Eraser")
	
	
####################################################
func _on_Tools_pressed() -> void:
	$'%Tools'.hide()
	$'%CanvasLayer'.show()
	
#########################################################
# COLOR BUTTONS
#
func _on_blue_pressed() -> void:
	brush_color = Color.blue
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Blue Time")
	closePalette()
	print("Close Palette")
	
func _on_green_pressed() -> void:
	brush_color = Color.limegreen
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Lime Green Time")
	closePalette()
	print("Close Palette")
	
func _on_orange_pressed() -> void:
	brush_color = Color.orange
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Orange Time")
	closePalette()
	print("Close Palette")
	
func _on_yellow_pressed() -> void:
	brush_color = Color.yellow
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Yellow Time")
	closePalette()
	print("Close Palette")
	
func _on_red_pressed() -> void:
	brush_color = Color.red
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Red Time")
	closePalette()
	print("Close Palette")
	
func _on_brown_pressed() -> void:
	brush_color = Color.brown
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Brown Time")
	closePalette()
	print("Close Palette")
	
func _on_darkslateGray_pressed() -> void:
	brush_color = Color.darkslategray
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Dark Gray Time")
	closePalette()
	print("Close Palette")
	
func _on_violet_pressed() -> void:
	brush_color = Color.violet
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Violet Time")
	closePalette()
	print("Close Palette")
	
func _on_indigo_pressed() -> void:
	brush_color = Color.indigo
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Indigo Time")
	closePalette()
	print("Close Palette")

func _on_gray_pressed() -> void:
	brush_color = Color.gray
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Gray Time")
	closePalette()
	print("Close Palette")

func _on_black_pressed() -> void:
	brush_color = Color.black
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Black Time")
	closePalette()
	print("Close Palette")

func _on_peach_pressed() -> void:
	brush_color = Color.peachpuff
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Peach Time")
	closePalette()
	print("Close Palette")

func _on_lawnGreen_pressed() -> void:
	brush_color = Color.lawngreen
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Lawn Green Time")
	closePalette()
	print("Close Palette")

func _on_skyBlue_pressed() -> void:
	brush_color = Color.skyblue
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Sky Blue Time")
	closePalette()
	print("Close Palette")

func _on_darkGreen_pressed() -> void:
	brush_color = Color.darkgreen
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Dark Green Time")
	closePalette()
	print("Close Palette")

func _on_olive_pressed() -> void:
	brush_color = Color.olive
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Olive Time")
	closePalette()
	print("Close Palette")

func _on_lightPink_pressed() -> void:
	brush_color = Color.lightpink
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Light Pink Time")
	closePalette()
	print("Close Palette")

func _on_salmon_pressed() -> void:
	brush_color = Color.salmon
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Salmon Time")
	closePalette()
	print("Close Palette")

func _on_teal_pressed() -> void:
	brush_color = Color.teal
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Teal Time")
	closePalette()
	print("Close Palette")

func _on_darkMagenta_pressed() -> void:
	brush_color = Color.darkmagenta
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Dark Magenta Time")
	closePalette()
	print("Close Palette")

func _on_darkGoldenrod_pressed() -> void:
	brush_color = Color.darkgoldenrod
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Dark Goldenrod Time")
	closePalette()
	print("Close Palette")

func _on_cornflower_pressed() -> void:
	brush_color = Color.cornflower
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Cornflower Time")
	closePalette()
	print("Close Palette")

func _on_aqua_pressed() -> void:
	brush_color = Color.aqua
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Aqua Time")
	closePalette()
	print("Close Palette")

func _on_darkBlue_pressed() -> void:
	brush_color = Color.darkblue
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Dark Blue Time")
	closePalette()
	print("Close Palette")

func _on_darkKhaki_pressed() -> void:
	brush_color = Color.darkkhaki
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Dark Khaki Time")
	closePalette()
	print("Close Palette")
	
func _on_silver_pressed() -> void:
	brush_color = Color.silver
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Silver Time")
	closePalette()
	print("Close Palette")
	
func _on_chocolate_pressed() -> void:
	brush_color = Color.chocolate
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Chocolate Time")
	closePalette()
	print("Close Palette")
	
func _on_lightSeaGreen_pressed() -> void:
	brush_color = Color.lightseagreen
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Light Sea Green Time")
	closePalette()
	print("Close Palette")
	
func _on_bananaYellow_pressed() -> void:
	brush_color = Color("FFE135")
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Banana Yellow Time")
	closePalette()
	print("Close Palette")
	
func _on_beaverBrown_pressed() -> void:
	brush_color = Color("9F8170")
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Beaver Brown Time")
	closePalette()
	print("Close Palette")
	
func _on_bitterLime_pressed() -> void:
	brush_color = Color("BFFF00")
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Bitter Lime Time")
	closePalette()
	print("Close Palette")
	
func _on_deepSaffron_pressed() -> void:
	brush_color = Color("FF9933")
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Deep Saffron Time")
	closePalette()
	print("Close Palette")
	
func _on_heliotrope_pressed() -> void:
	brush_color = Color("DF73FF")
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Heliotrope Time")
	closePalette()
	print("Close Palette")

func _on_malachite_pressed() -> void:
	brush_color = Color("0BDA51")
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Malachite Time")
	closePalette()
	print("Close Palette")

func _on_sage_pressed() -> void:
	brush_color = Color("BCB88A")
	brush_thickness = $'%brush'.value
	brush_tip.modulate = Color(brush_color)
	print("Sage Time")
	closePalette()
	print("Close Palette")



###############################
func _on_exitBlock_pressed() -> void:
	$'%Tools'.show()
	$'%CanvasLayer'.hide()
	
