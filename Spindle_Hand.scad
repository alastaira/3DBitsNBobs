include <BOSL2/std.scad>
$fn=64;


hand();


module hand(){
  diff(){
    zcyl(d=4, h=0.4);
    cuboid([26,.8,0.4], anchor=LEFT, rounding=0.3, edges="Z");

    
    tag("remove") { 
      union(){
        zcyl(d=2.4,h=1);
        cuboid([4, .4,1], anchor=RIGHT);
      }
  } 
  }
}
