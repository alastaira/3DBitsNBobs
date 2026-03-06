include <BOSL2/std.scad>
$fn=100;

diff(){
  rect_tube(isize=[90,90], size=[101,101],h=.8, irounding=5);
  rect_tube(isize=[101,101], wall=1, h=10, rounding=2)
  position(FRONT+LEFT)
  #tag("remove") right(2) up(-4.2) cuboid([5,10,10], anchor=BOTTOM+LEFT);

}