extends Viewport

onready var savePath = OS.get_system_dir(OS.SYSTEM_DIR_PICTURES)

func _on_saveButton_pressed():
	var os_name = OS.get_name()
	#This is for the when the game detects its Windows/Android
	if os_name == "Android":
		$'%deviceused'.text = "Device Used: " + str("Android")
		var view = get_viewport()
		var screenshot = view.get_texture().get_data()
		var image = Image.new()
		image.create_from_data(view.get_size().x, view.get_size().y, false, Image.FORMAT_RGBA8, screenshot)
		var file = File.new()
		var timedate = String(OS.get_datetime().hour).pad_zeros(2) + String(OS.get_datetime().minute).pad_zeros(2) + String(OS.get_datetime().second).pad_zeros(2) + String(OS.get_datetime().year) + String(OS.get_datetime().month).pad_zeros(2) + String(OS.get_datetime().day).pad_zeros(2) 
		var savePNG = OS.get_system_dir(OS.SYSTEM_DIR_PICTURES) + timedate +".png"
		file.open(savePNG, File.WRITE)
		image.save_png(file)
		file.close()
		
	if os_name == "Windows":
		$'%deviceused'.text = "Device Used: " + str("Windows")
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



