extends "res://Scripts/Entity/LivingEntity/LivingEntity.gd"

const INVINCIBILITY_DURATION = 0.6

var speed = 1
var fire_rate = 1
var base_damage = 50
var base_bullet_speed = 5
var base_range = 5
var max_health = 3

var shooting = false

var invincibility = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _input(event):
	if event is InputEventKey or event is InputEventMouseButton:
		if Input.is_action_pressed("move_right"):
			key_force.x += 1
		if Input.is_action_pressed("move_left"):
			key_force.x -= 1
		if Input.is_action_pressed("move_down"):
			key_force.y += 1
		if Input.is_action_pressed("move_up"):
			key_force.y -= 1
		if Input.is_action_pressed("shoot"):
			shooting = true
		if Input.is_action_just_released("shoot"):
			shooting = false

func _process(delta):
	
	pass

func take_damage(damage, attacker = null):
	if invincibility <= 0:
		.take_damage(damage)
		
		invincibility = INVINCIBILITY_DURATION

func heal(amount):
	if hitpoints + amount <= max_health:
		hitpoints += amount
	else:
		hitpoints = max_health


