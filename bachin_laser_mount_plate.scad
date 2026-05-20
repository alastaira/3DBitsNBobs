include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=100;

diff(){
  cuboid([70, 83, 7.5], rounding=1, edges="Z")
  move_copies([[-29, 35.5, 0], [29, 35.5, 0], [-10.5, -35.5, 0], [10.5, -35.5, 0]]) {
  attach(TOP) {
    screw_hole("M3,7.5", anchor=TOP, thread=false);
    nut_trap_inline(2, "M3", anchor=TOP);
    }
  }
}