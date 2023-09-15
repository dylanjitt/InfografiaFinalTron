extends Line2D

var segments=[]
var segmentScene = preload("res://hitbox.tscn")
var countInsance=0
var currentPos=0
var turns=0
signal collision(area)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	remove_first_segments(10)

func _on_moto_update_points(position):
	add_point(position)
	countInsance+=1
	#var moto_tron= $Moto
	if countInsance%10==0:
		currentPos=position
		for i in (points.size() - 1):
			var segment_instance = segmentScene.instantiate()
			segment_instance.position=currentPos
		#print(segment_instance.position)
			segments.append(segment_instance)
			add_child(segment_instance)
	print(segments.size())
	if points.size()==200:
		remove_point(0)
		#if segments.size()>=100:
			#var removed_segment = segments.pop_front()
		if turns<=20:
			remove_first_segments(10*turns)
		

func remove_first_segments(count):
	for i in range(count):
		if segments.size() > 0:
			var removed_segment = segments[0]
			segments.remove_at(0)
			remove_child(removed_segment)




func _on_moto_turn():
	#remove_first_segments(20)
	if turns<=20:
		turns+=2


func _on_moto_player_dead():
	pass # Replace with function body.
