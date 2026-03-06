include <BOSL2/std.scad>
include <BOSL2/joiners.scad>


diff() {
  cuboid([160,160,3]) {
    attach(BACK) xcopies(20,5) dovetail("male", slide=3, width=15, taper=4, height=3);
    tag("remove") attach(FRONT) xcopies(20,5) dovetail("female", slide=3, width=15, taper=4, height=3);
    
    attach(LEFT) xcopies(20,5) dovetail("male", slide=3, width=15, taper=4, height=3);
    tag("remove") attach(RIGHT) xcopies(20,5) dovetail("female", slide=3, width=15, taper=4, height=3);  
  }
  
  tag("remove") ycopies(40,3) cuboid([120,30,3]);
  
}