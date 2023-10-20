extends VehicleBody

#steering max value#
export (float) var max_steer_angle = 0.3 #value can be changed

#engine engine speed#
export (float) var min_engine_speed = 50.0
export (float) var engine_speed = 100.0
export (float) var max-engine_speed = 200.0


func _physics_process(delta):
  steering = Input.get_axis("ul_left", "ul_right") * max_steer_angle * delta

  #starting on a low speed#
  engine_force = Input.get_axis("ul_up", "ul_down") * min_engine_speed * delta

  #increasing speed#
  if (engine_force >= 80):
    engine_force = Input.get_axis("ul_up", "ul_down") * engine_speed * delta
  elif (engine_force >= 120):
    engine_force = Input.get_axis("ul_up", "ul_down") * max_engine_speed * delta
  else:
    engine_force = 0
