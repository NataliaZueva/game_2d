extends Area2D

@onready var player = $".."

func _on_body_entered(body: Node2D) -> void:
	if body is Mobe: 
		player.hp -= 1
		
