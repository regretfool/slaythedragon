extends CharacterBody2D

# @export - changeable setting in node inspector
# How fast player will move in pixels/sec
@export var speed: float = 300.0
# Size of game window
var screen_size

func get_input():
	# Has length (max) = 1 unless we change the deadzone
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Assign viewport size to value so we can limit bounds for movement
	screen_size = get_viewport_rect().size


# ----- _process is called every frame. 'delta' is the elapsed time since the previous frame.
# We need to 
#    Check for input.
#    Move in the given direction.
#    Play the appropriate animation. (To be added once I play around more with aseprite)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	get_input()
	move_and_slide()
	# clamp() to prevent it from leaving the screen
	# Clamping a value means restricting it to a given range (screen size for example)
	# ---> (change into arena bounds later)
	position = position.clamp(Vector2.ZERO, screen_size)

# Apparently I don't need all this because Godot's Input has a get_vector method
# that normalizes the diagonal vector for me already :)
#func _process(delta: float) -> void:
##------- Movement direction (+ speed -> velocity) -------
	## Every frame we listen for user input
	#var velocity = Vector2.ZERO  #  Player's movement vector, (0,0) for start (no movement)
	## Listening for input
	#if Input.is_action_pressed("up"):  # Returns true or false if it matches input map from input map
		## Set movement vectors
		## (0,0)------- 1 going right, -1 going left
		## |
		## |
		## |
		## 1 going down, -1 going up (viewport square)
		#velocity.y -= 1
	#if Input.is_action_pressed("down"):
		#velocity.y += 1
	#if Input.is_action_pressed("right"):
		#velocity.x += 1
	#if Input.is_action_pressed("left"):
		#velocity.x -= 1
#
##------- Fix diagonal movement -------
#
##------- Update player position -------
	#position += velocity * speed * delta  # With every frame we add direction + time. Delta is our time.
	## clamp() to prevent it from leaving the screen
	## Clamping a value means restricting it to a given range (screen size for example)
	## ---> (change into arena bounds later)
	#position = position.clamp(Vector2.ZERO, screen_size)
