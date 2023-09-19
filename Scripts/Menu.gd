extends Control
	
	 

func _on_OptionsButton_pressed():
	get_tree().change_scene("res://Scenes/Options.tscn")




func _on_QuitButton_pressed():
	get_tree().quit()
#get play button to work


func _on_PlayButton_button_down():
	get_tree().change_scene("res://Scenes/Game.tscn")


func _on_OptionsButton_button_down():
	get_tree().change_scene("res://Scenes/Options.tscn")
#hi
