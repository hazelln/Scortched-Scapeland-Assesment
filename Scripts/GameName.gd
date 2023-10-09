extends RichTextLabel

func _ready():
	# The curve strength
	var curve_strength = 30
	# The radius of the curve
	var curve_radius = 200
	
	var total_chars = len(text)
	var new_text = ""
	
	
