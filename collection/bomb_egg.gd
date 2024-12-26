extends Area2D

@onready var anim = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player": 
		$AudioStreamPlayer.play()
		anim.play("explosion")
		var tween = get_tree().create_tween()
		tween.tween_property(self, "modulate:a", 0, 0.3)
		tween.tween_callback(queue_free)
		body.hp -= 1
