extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_P1_hitbox_area_entered(area):
	get_tree().call_group("moto","dead")
	get_tree().call_group("moto2","dead")


func _on_area_entered(area):
	get_tree().call_group("moto","dead")
	get_tree().call_group("moto2","dead")
