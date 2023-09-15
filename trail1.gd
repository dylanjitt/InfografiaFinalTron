extends Line2D

var segments=[]
var segmentScene = preload("res://hitbox.tscn")
var countInsance=0
var currentPos=0
var turns=0
var dead = false
var moving = false
signal collision(area)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	remove_first_segments(turns)

func _on_moto_update_points(position):
	if dead == false:#&&moving==true:
		add_point(position)
		countInsance+=1
		#var moto_tron= $Moto
		if countInsance%5==0:
			currentPos=position
			print("-----------------",countInsance)
			for i in (points.size() - 1):
				var segment_instance = segmentScene.instantiate()
				segment_instance.position=currentPos
				#print(segment_instance.position)
				segments.append(segment_instance)
				add_child(segment_instance)
		
		if points.size()==150:
			remove_point(0)
			#if segments.size()>=100:
				#var removed_segment = segments.pop_front()
		if turns<=20:
			remove_first_segments(1*turns)
	print(segments.size())
		

func remove_first_segments(count):
	for i in range(count):
		if segments.size() > 0:
			var removed_segment = segments[0]
			remove_child(removed_segment)
			segments.remove_at(0)

func _on_moto_turn():
	#remove_first_segments(20)
	#if turns<=10:
	#	turns+=2
	#	remove_first_segments(10)
	#else:
	#	remove_first_segments(10*turns)
	turns+=1
	print(turns)
	remove_first_segments(20*turns)


func _on_moto_player_dead():
	clear_points()
	remove_first_segments(segments.size())
	dead=true


func _on_moto_moving():
	moving==true
