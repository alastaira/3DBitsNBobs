include <BOSL2/std.scad>
$fn=64;

diff()
  cuboid([95,55,1], rounding=2, edges="Z") {
  //  tag("remove") cuboid([70,35,3], rounding=2, edges="Z");
    
 tag("remove") move_copies([[-88.5/2,-48/2,0], [-88.5/2,48/2,0], [88.5/2,-48/2,0], [88.5/2,48/2,0]])
  zcyl(d=4, h=4);
    position(BOTTOM)
tag("remove") grid_copies(spacing=10, n=[16,5], stagger="alt") cylinder(d=6, h=5);
    /*
align(TOP)
 move_copies([[-88.5/2,-48/2,0], [-88.5/2,48/2,0], [88.5/2,-48/2,0], [88.5/2,48/2,0]])
  zcyl(d=3, h=4);
    
    */
}