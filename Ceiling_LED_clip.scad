include <BOSL2/std.scad>
include <BOSL2/threading.scad>

include <BOSL2/screws.scad>
$fn=64;

//beam();
clip();

module beam(){
  color("#cdaa7d")
  cuboid([2400,12,12], anchor=TOP);
}

module clip(){
  color("white")
  diff(){
    cuboid([8,16,16], rounding=3, edges=[BOTTOM+FRONT,BOTTOM+BACK], anchor=TOP);
    tag("remove") cuboid([8.1,12.1,14.1], anchor=TOP);
  }
  yflip_copy(12) {
    diff(){
      cuboid([8,8,3], anchor=TOP, rounding=1, edges=[BACK+LEFT, BACK+RIGHT]);
      tag("remove") screw_hole("M3,3.5", head="flat", counterbore=0, orient=DOWN, anchor=BOTTOM);
    }
  }
}