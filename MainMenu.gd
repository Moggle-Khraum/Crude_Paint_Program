extends Control


func _on_paintButton_pressed() -> void:
	var _paint = get_tree().change_scene("res://Node2D.tscn")
	print("Let's Paint!")
	
func _on_exitButton_pressed() -> void:
	get_tree().quit()
	print("Program Exits")
