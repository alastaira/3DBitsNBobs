include <BOSL2/std.scad>
$fn=64;

diff(){
  cuboid([12,45,8.5], anchor=BOTTOM);
  tag("remove")    
    cuboid([12,33,4.5], anchor=BOTTOM);
tag("remove")
grid_copies([7,20.5], n=[2,2])
  up(3) zcyl(d=2.3,h=10, anchor=BOTTOM);

}