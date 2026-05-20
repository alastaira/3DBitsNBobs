include <BOSL2/std.scad>
$fn=100;
//import("C:\\Users\\alast\\Downloads\\IEC_C8.stl", convexity=3);

difference(){

cuboid([28,16,2], rounding=1, edges="Z", anchor=FRONT+LEFT+BOTTOM)
  attach(TOP){
  left(8) cuboid([3,10,12], anchor=BOTTOM, rounding=1, edges="Z")
  attach(TOP+LEFT){
    rotate([0,64,0]) 
    cuboid([2,7,11], anchor=TOP+LEFT, rounding=1, edges=[BOTTOM+LEFT]);
  }
  right(8) cuboid([3,10,12], anchor=BOTTOM, rounding=1, edges="Z")
  attach(TOP+RIGHT) {
    rotate([0,64,0]) 
    cuboid([2,7,11], anchor=TOP+LEFT, rounding=1, edges=[BOTTOM+LEFT]);
  }
}

translate([14, 8])
intersection(){
  cuboid([7.8, 6.9,8], anchor=BOTTOM);
  zcyl(d=7.8, h=8);
  }
  
  }