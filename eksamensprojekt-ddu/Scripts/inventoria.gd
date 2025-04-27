extends ItemList


func add_slot(ID = "0"):
	var image = Image.load_from_file("res://assets/" + ItemD.get_texture_name(ID))
	image.resize(image.get_width() / 2, image.get_height() / 2, Image.INTERPOLATE_LANCZOS)

	var texture = ImageTexture.create_from_image(image)

	var item_name = ItemD.get_item_name(ID)
	add_item(item_name, texture)

	

func _input(event):
	if event.is_action_pressed("Inventoria"):
		visible = !visible
		if visible == true and item_count > 0:
			grab_focus()
			select(0)

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Second_menu.tscn")
