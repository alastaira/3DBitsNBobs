include <NopSCADlib/core.scad>
use <NopSCADlib/utils/layout.scad>
include <NopSCADlib/vitamins/pulleys.scad>
include <NopSCADlib/vitamins/linear_bearings.scad>
include <NopSCADlib/vitamins/belts.scad>
include <NopSCADlib/vitamins/stepper_motors.scad>
include <NopSCADlib/vitamins/extrusions.scad>
include <NopSCADlib/vitamins/extrusion_brackets.scad>

include <BOSL2/std.scad>
include <BOSL2/nema_steppers.scad>
include <BOSL2/screws.scad>

roller_bracket();
/*
motor_face_plate();
right(70)
motor_support_bracket();
if($preview)
  vitamins();
*/

//right(60)import("C:\\Users\\alast\\Downloads\\mini-conveyor-model_files\\bearing_holder_endcap.stl");

module roller_bracket() {
  diff(){
    hull(){
      //union()
      left(40) ycyl(d=26, h=23, $fn=64);
      cuboid([35, 23, 26]); 
    }
    tag("remove") left(40) ycyl(d=15.2, h=24, $fn=64);
    #tag("remove") back(1.5) right(2.5)  cuboid([30,20,20]);
    tag("remove") move_copies([[-5, 1.5, 5], [10, 1.5, 10], [-5, 1.5, -15], [10, 1.5, -15]])  screw_hole("M5,8", thread=false, anchor=BOTTOM);
    tag("remove") move_copies([[-5, -5, 0], [10, -5, 0]])  screw_hole("M5,8", thread=false, anchor=BOTTOM, orient=FRONT);
  }
  //left(40) rotate([90, 0, 0])linear_bearing(LM8UU);
}
  


module motor_face_plate(){
  diff(){
    cuboid([42,62,3], rounding=4, edges="Z", anchor=BOTTOM+BACK)
    attach(TOP) position(BACK) {
      tag("remove") fwd(20+(42/2)) nema_mount_mask(size=17, depth=5, l=0, $slop=0.1, anchor=TOP);
      tag("remove") move_copies([[-12, -10, 0], [12, -10, 0]])  screw_hole("M5,8", thread=false, anchor=TOP);
    }
  }
}


module motor_support_bracket() {
  diff(){
    cuboid([62,72,3], rounding=4, edges="Z", anchor=BOTTOM+BACK)
    attach(TOP) position(BACK) {
      tag("remove") fwd(20+(42/2)) cuboid([42, 42, 5], chamfer=4, edges="Z", anchor=TOP);
      tag("remove") move_copies([[-12, -10, 0], [12, -10, 0]])  screw_hole("M5,8", thread=false, anchor=TOP);
    }
  }

}



module vitamins(){
  translate([0,25,31.2]) rotate([90,0,90])
  extrusion(E2020, 1000, cornerHole = true);
  // Stepper Motor
  back(15) rotate([90,0,0]) NEMA(NEMA17_40);
  // Pulley wheel
  rotate([90,0,0]) pulley_assembly(GT2x16_pulley);
  // Pulley wheel
  path = [[0,0,6], [-100, 40, 30],];
  rotate([90, 0, 0]) belt(GT2x6, path, open = false);
  translate([-100, 0, 40]) rotate([90,0,0]) linear_bearing(LM8UU);
  }