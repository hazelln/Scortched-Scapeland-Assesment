extends RichTextLabel

func _ready():
	# The curve strength
	var curve_strength = 30
	# The radius of the curve
	var curve_radius = 200
	
	var total_chars = len(text)
	var new_text = ""
	
	for i in range(total_chars):
		
		# Calculate the angle for the character
		var angle = deg2rad(i / (total_chars - 1) * curve_strength - curve_strength / 2)
		# Calculate the position on the curve
		var x = curve_radius * sin(angle)
		var y = curve_radius * cos(angle)
		
		# Wrap the character in a 'pos' tag to set its position
		new_text += "<pos=(" + str(x) + "," + str(y) + ")>" + text[i] + "</pos>"
	
	#bbcode_text = new_text

#func calculateCharacterAngle(character_index, total_characters, curve_strength):
	#var angle = deg2rad(character_index / (18 - 1) * curve_strength - curve_strength / 2)
	#return angle
