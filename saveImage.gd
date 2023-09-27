extends Viewport

onready var savePath = OS.get_system_dir(OS.SYSTEM_DIR_PICTURES)

func _on_saveButton_pressed():
	var timedate = String(OS.get_datetime().hour).pad_zeros(2) + String(OS.get_datetime().minute).pad_zeros(2) + String(OS.get_datetime().second).pad_zeros(2) + String(OS.get_datetime().year) + String(OS.get_datetime().month).pad_zeros(2) + String(OS.get_datetime().day).pad_zeros(2) 
	var img : Image = get_texture().get_data()
	img.flip_y()
	# warning-ignore:return_value_discarded
	img.save_png(savePath.plus_file(timedate + ".png"))
	print("Image Saved")
	var timer = get_tree().create_timer(0.8)
	timer.connect("timeout", self, "showNotif")
	
func showNotif():
	$'%savePopup'.show()
	var timer = get_tree().create_timer(5.0)
	timer.connect("timeout", self, "hideNotif")
	print("Shows Notif Panel")
	
func hideNotif():
	$'%savePopup'.hide()
	print("Hide Notif Panel")

