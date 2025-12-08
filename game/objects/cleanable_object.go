components {
  id: "cleanable_object_controller"
  component: "/game/scripts/cleanable_object_controller.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "tile_set: \"/assets/game_levels.atlas\"\n"
  "default_animation: \"level_1\"\n"
  "material: \"/game/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: 0.005
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "effects_sprite"
  type: "sprite"
  data: "tile_set: \"/assets/game_scene.atlas\"\n"
  "default_animation: \"explosion\"\n"
  "material: \"/game/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: 0.01
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "cover"
  type: "sprite"
  data: "tile_set: \"/assets/game_scene.atlas\"\n"
  "default_animation: \"tile_dirty\"\n"
  "material: \"/game/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: 0.008
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
