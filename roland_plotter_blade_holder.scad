include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=100;

holder();

//up(22)
//cover();


module cover() {
  diff(){
    cuboid([30, 20, 3], rounding=1, edges=[FRONT+LEFT, FRONT+RIGHT], anchor=BACK+BOTTOM)
    attach(TOP) {
    tag("remove")cylinder(d=12.5, h=8.5, anchor=CENTER);
    move_copies([[-12, 0, 0], [12, 0, 0]]) {
        screw_hole("M3,20", anchor=TOP, thread=false);
      }
      }
  }
}

module holder() {
  translate([0, 3/2,  55/2])
  rotate([90,0,0])
  difference(){
    cuboid([30,55,3]);
    grid_copies(spacing=[16,40], n=[2,2], stagger=false) cylinder(d=3.2, h=8.5, anchor=CENTER);
  }

  up(12)
  diff(){
    cuboid([30, 20, 10], rounding=1, edges=[FRONT+LEFT, FRONT+RIGHT], anchor=BACK+BOTTOM){
    attach(TOP){
      tag("remove")cylinder(d=16.1, h=2, anchor=TOP)      //16 is snug
      tag("remove")cylinder(d=12, h=20, anchor=TOP);   //11.7 is snug
      move_copies([[-12, 0, 0], [12, 0, 0]]) {
        screw_hole("M3,20", anchor=TOP, thread=false);
      }
    }
    /*
    attach(BOTTOM){
      move_copies([[-12, 0, 0], [12, 0, 0]]) {
        nut_trap_inline(2, "M3", anchor=TOP);
      }
    }
    */
  position(BOTTOM){

        translate([12, 0, 2])
        nut_trap_side(10, "M3", $slop=0.1);

        translate([-12, 0, 2])
        nut_trap_side(10, "M3", spin=180, $slop=0.1);
        
  }
    }
  }
}