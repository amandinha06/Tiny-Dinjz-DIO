extends Node

@export var mob_spawner: MobSpawner
@export var initial_spawn_rate: float = 30.0
@export var mobs_rate_per_minute: float = 30
@export var wave_duration:float = 20.0
@export var braek_intensity: float = 0.5

var time:float = 0.0

func _process(delta: float) -> void:
	if GameManager.is_game_over: return
	time += delta
	
	var spawn_rate = initial_spawn_rate + mobs_rate_per_minute * (time/ 60.0)
	
	var sin_wave = sin((time * TAU) / wave_duration)
	var wave_factor = remap(sin_wave, -1.0, 1.0, braek_intensity, 1)
	spawn_rate += wave_factor
	
	mob_spawner.mobs_per_minute = spawn_rate
	
