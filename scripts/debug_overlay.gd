extends CanvasLayer

# Debug overlay by Gonkee - full tutorial https://youtu.be/8Us2cteHbbo
var stats = []

func add_stat(stat_name, object, stat_ref, is_method, params=[]):
	stats.append([stat_name, object, stat_ref, is_method, params])

func _process(_delta):
	var label_text = ""
	
	var fps = Engine.get_frames_per_second()
	label_text += str("FPS: ", fps)
	label_text += "\n"
	
	var mem = OS.get_static_memory_usage()
	label_text += str("Static Memory: ", String.humanize_size(mem))
	label_text += "\n"
	
	for s in stats:
		var value = null
		# if typeof(s[1]) == TYPE_ARRAY: 
		# 	for i in range(s[1].size):
		# 		if s[1][i] and weakref(s[1][i]).get_ref():
		# 			if s[3]:
		# 				if len(s[4]) == 0:
		# 					value = s[1][i].call(s[2])
		# 				else:
		# 					value = s[1][i].callv(s[2], s[4])
		# 			else:
		# 				value = s[1][i].get(s[2])
		# 			label_text += str(s[0], " ", i, ": ", value)
		# 			label_text += "\n"
		# else :
		if s[1] and weakref(s[1]).get_ref():
			if s[3]:
				if len(s[4]) == 0:
					value = s[1].call(s[2])
				else:
					value = s[1].callv(s[2], s[4])
			else:
				value = s[1].get(s[2])
		label_text += str(s[0], ": ", value)
		label_text += "\n"
	
	$Label.text = label_text
