extends Control


func _on_paintButton_pressed() -> void:
	var _paint = get_tree().change_scene("res://Node2D.tscn")
	print("Let's Paint!")
	
func _on_exitButton_pressed() -> void:
	get_tree().quit()
	print("Program Exits")


func _on_RichTextLabel_meta_clicked(meta) -> void:
	var err = OS.shell_open(meta)
	if err == OK:
		print("Opened link '%s' successfully!" % meta)
	else:
		print("Failed opening the link '%s'!" % meta)
	
