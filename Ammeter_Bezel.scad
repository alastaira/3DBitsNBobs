include <BOSL2/std.scad>

difference(){
  cuboid([66,58,10], rounding=1, edges="Z", $fn=64);
  cuboid([63.5,55.5,10], rounding=1, edges="Z", $fn=64); 
}