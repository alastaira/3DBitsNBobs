//11.5
//9.8
include <BOSL2/std.scad>
$fn=64;

diff(){
  base();
  tag("remove")
    back(11.5)
    right(1)
   zcyl(d=3.5, h=2, anchor=BOTTOM);

  tag("remove")
    right(18) up(.5)
    #cuboid([4,5,2], anchor=BOTTOM);
   
  tag("remove")
    up(1) left(4)
    #cuboid([20,5,1], anchor=BOTTOM+LEFT);
   
   
   
  // Mounting points
  zcyl(d=3.5, h=2, anchor=TOP);
  right(9.8)
  zcyl(d=3.5, h=2, anchor=TOP);   
}


module base(){
  linear_extrude(2)
    chain_hull(){
      back(11.5)
      right(1)
      circle(d=7);
      circle(d=7);
      right(20)
      circle(d=7);
    }
}
