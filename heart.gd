extends Node

@onready var player = $"../../Player/Player"
@onready var hp1 = $Heart1
@onready var hp2 = $Heart2
@onready var hp3 = $Heart3

func _process(_delta: float) -> void:  
	var _value = player.hp 

	# Скрываем сердечки в зависимости от текущего значения здоровья
	hp1.visible = _value > 0
	hp2.visible = _value > 1
	hp3.visible = _value > 2
	
	# Если здоровье меньше или равно нулю, скрываем игрока
	if _value <= 0: 
		player.visible = false 
	else:
		player.visible = true  # Показываем игрока, если у него есть здоровье
