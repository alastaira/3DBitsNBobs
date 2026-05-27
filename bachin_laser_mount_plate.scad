include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=100;

// Plate for BachinMaker 4050 : https://web.archive.org/web/20230923232347/https://www.bachinmaker.com/?p=41&a=view&r=212
// Adjustable Z-Axis : https://www.aliexpress.com/item/1005011967097751.html

diff(){
  cuboid([70, 83, 7.5], rounding=1, edges="Z") {
  attach(TOP) {
    move_copies([[-29, 35.5, 0], [29, 35.5, 0], [-10.5, -35.5, 0], [10.5, -35.5, 0]]) {
      screw_hole("M3,7.5", anchor=TOP, thread=false);
      nut_trap_inline(2, "M3", anchor=TOP);
    }
  }
  attach(BOTTOM) {  
    move_copies([[-8.5, -15, 0], [-8.5, 15, 0], [8.5, -15, 0], [8.5, 15, 0]]) {
    screw_hole("M3,7.5", anchor=TOP, thread=false);
    nut_trap_inline(2, "M3", anchor=TOP);
    }
  }
}}