extends Node2D

var lines = Node2D.new()
onready var lines_node = add_child(lines)
onready var brush_tip = $'%brushTip'

var pressed = false
var current_line: Line2D
var brush_color = Color.white
var brush_thickness = 5
var brush_smoothness = 8

var popup_open = false
onready var colorButton = $'%colorButton'
onready var penButton = $'%penButton'


#THIS IS THE CODE FOR DRAWING
func _draw():
	for i in range(lines.get_child_count()):
		var line = lines.get_child(i)
		draw_line(line.points, line.default_color, brush_thickness)

#THIS IS THE CODE FOR THE INPUT
func _input(event: InputEvent) -> void:
	if !popup_open:
		if event is InputEventMouseButton and InputEventScreenTouch:
			pressed = event.pressed
		
			if pressed:
				current_line = Line2D.new()
				current_line.sharp_limit = 2
				current_line.default_color = brush_color
				current_line.width = brush_thickness
				current_line.antialiased = true
				current_line.round_precision = brush_smoothness
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
	brush_thickness = 30
	brush_tip.modulate = Color(1, 1, 1)
	print("Erasing Time")
	
##############################################
#FOR THE BRUSH THICKNESS | SIZE OF THE BRUSH
func _on_HSlider_value_changed(value: float) -> void:
	brush_thickness = value
	var label = $'%brushSize'
	label.text = str(value)
	var _slider = $'%HSlider'
	_slider.value = value

#FOR THE BRUSH SMOOTHNESS | CURVE OF THE BRUSH
func _on_HSlider2_value_changed(value: float) -> void:
	brush_smoothness = value
	var kinisLabel = $'%brushSmooth'
	kinisLabel.text = str(value)
	var _slider2 = $'%HSlider2'
	_slider2.value = value
	
###############################################
#FOR SHOWING COLOR PALETTE
#
func _on_colorButton_pressed() -> void:
	if not popup_open:
		#This will show the Panel Container
		$'%PanelContainer'.show()
		popup_open = true
		print("Show Palette")
		$'%penButton'.hide()
		$'%disableBrush'.show()
		print("Disabled Pen Button")
		
func _on_xButton_pressed() -> void:
	$'%PanelContainer'.hide()
	popup_open = false
	print("Hide Palette")
	$'%penButton'.show()
	$'%disableBrush'.hide()
	print("Enabled Color")
	
##########################################
#For the Button Resizer

func _on_penButton_pressed() -> void:
	if not popup_open:
		$'%BrushSize'.show()
		popup_open = true
		print("Show Brush|Pen")
		$'%colorButton'.hide()
		$'%disableColor'.show()
		print("Disabled Color")

func _on_exitXButton_pressed() -> void:
	$'%BrushSize'.hide()
	popup_open = false
	$'%colorButton'.show()
	print("Enabled Pen")
	$'%disableColor'.hide()

#########################################################
# COLOR BUTTONS
#
func _on_blue_pressed() -> void:
	brush_color = Color.blue
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0, 0, 1)
	print("Blue Time")
	
func _on_green_pressed() -> void:
	brush_color = Color.limegreen
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.2, 0.8, 0.2)
	print("Lime Green Time")
	
func _on_orange_pressed() -> void:
	brush_color = Color.orange
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(1, 0.5, 0)
	print("Orange Time")
	
func _on_yellow_pressed() -> void:
	brush_color = Color.yellow
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(1, 1, 0)
	print("Yellow Time")
	
func _on_red_pressed() -> void:
	brush_color = Color.red
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(1, 0, 0)
	print("Red Time")
	
func _on_brown_pressed() -> void:
	brush_color = Color.brown
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.64, 0.16, 0.16)
	print("Brown Time")
	
func _on_darkslateGray_pressed() -> void:
	brush_color = Color.darkslategray
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.18, 0.31, 0.31)
	print("Dark Gray Time")
	
func _on_violet_pressed() -> void:
	brush_color = Color.violet
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.93, 0.51, 0.93)
	print("Violet Time")
	
func _on_indigo_pressed() -> void:
	brush_color = Color.indigo
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.29, 0, 0.51)
	print("Indigo Time")

func _on_gray_pressed() -> void:
	brush_color = Color.gray
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.5, 0.5, 0.5)
	print("Gray Time")

func _on_black_pressed() -> void:
	brush_color = Color.black
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0, 0, 0)
	print("Black Time")

func _on_peach_pressed() -> void:
	brush_color = Color.peachpuff
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(1, 0.9, 0.71)
	print("Peach Time")

func _on_lawnGreen_pressed() -> void:
	brush_color = Color.lawngreen
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.49, 0.99, 0)
	print("Lawn Green Time")

func _on_skyBlue_pressed() -> void:
	brush_color = Color.skyblue
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.53, 0.81, 0.92)
	print("Sky Blue Time")

func _on_darkGreen_pressed() -> void:
	brush_color = Color.darkgreen
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0, 0.5, 0)
	print("Dark Green Time")

func _on_olive_pressed() -> void:
	brush_color = Color.olive
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.5, 0.5, 0)
	print("Olive Time")

func _on_lightPink_pressed() -> void:
	brush_color = Color.lightpink
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(1, 0.71, 0.76)
	print("Light Pink Time")

func _on_salmon_pressed() -> void:
	brush_color = Color.salmon
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(1, 0.55, 0.41)
	print("Salmon Time")

func _on_teal_pressed() -> void:
	brush_color = Color.teal
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0, 0.5, 0.5)
	print("Teal Time")

func _on_darkMagenta_pressed() -> void:
	brush_color = Color.darkmagenta
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.5, 0, 0.5)
	print("Dark Magenta Time")

func _on_darkGoldenrod_pressed() -> void:
	brush_color = Color.darkgoldenrod
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.72, 0.53, 0.04)
	print("Dark Goldenrod Time")

func _on_cornflower_pressed() -> void:
	brush_color = Color.cornflower
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.40, 0.59, 0.92)
	print("Cornflower Time")

func _on_aqua_pressed() -> void:
	brush_color = Color.aqua
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.0, 1.0, 1.0)
	print("Aqua Time")

func _on_darkBlue_pressed() -> void:
	brush_color = Color.darkblue
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.0, 0.0, 0.55)
	print("Dark Blue Time")

func _on_darkKhaki_pressed() -> void:
	brush_color = Color.darkkhaki
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.74, 0.71, 0.42)
	print("Dark Khaki Time")
	
func _on_silver_pressed() -> void:
	brush_color = Color.silver
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.75, 0.75, 0.75)
	print("Silver Time")
	
func _on_chocolate_pressed() -> void:
	brush_color = Color.chocolate
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.82, 0.41, 0.11)
	print("Chocolate Time")
	
func _on_lightSeaGreen_pressed() -> void:
	brush_color = Color.lightseagreen
	brush_thickness = $'%HSlider'.value
	brush_smoothness = $'%HSlider2'.value
	brush_tip.modulate = Color(0.13, 0.7, 0.67)
	print("Light Sea Green Time")
	
	
	









#extends Node2D

#var lines = Node2D.new()
#onready var lines_node = add_child(lines)

#var pressed = false
#var current_line: Line2D

#func _input(event: InputEvent) -> void:
#	if event is InputEventMouseButton:
#		pressed = event.pressed
		
#		if pressed:
#			current_line = Line2D.new()
#			lines.add_child(current_line)
#	if event is InputEventMouseMotion && pressed:
#		current_line.add_point(event.position)

#func _draw():
#	for i in range(lines.get_child_count()):
#		var line = lines.get_child(i)
#		line.default_color = brush_color
#		for j in range(line.points.size() - 1):
#			draw_line(line.points[j], line.points[j + 1], line.default_color, brush_size)











