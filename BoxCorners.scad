include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=64;


difference(){
linear_extrude(30)
difference(){
  chain_hull(){
  back(25) circle(d=2);
  back(15) circle(d=2);
  back(10) circle(d=8);
  circle(d=8);
  right(10) circle(d=8);
  right(15) circle(d=2);
  right(25) circle(d=2);
  }
  square([40,40], anchor=BOTTOM+LEFT);
  }
translate([20,-1.01,15])
  screw_hole("M3,12",  head="flat small", orient=FORWARD, anchor=TOP);

translate([-1.01, 20,15])
  screw_hole("M3,12",  head="flat small", orient=LEFT, anchor=TOP);
 
  
}
