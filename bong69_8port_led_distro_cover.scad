include <BOSL2/std.scad>
include <BOSL2/threading.scad>
include <BOSL2/screws.scad>
$fn=64;


linear_extrude(2)

diff(){
  rect([110,70], rounding=3){
  tag("remove") grid_copies([102,62]) circle(d=3);

  fwd(2)
  tag("remove") rect([106,6], rounding=2);

  position(TOP+RIGHT)
  left(8)
  tag("remove") rect([16,16], rounding=[-2,-2,2,2], anchor=TOP+RIGHT);

  position(BOTTOM)
    left(7)
  tag("remove") trapezoid(h=15, w1=16, w2=15, rounding=[2,2,-2,-2], anchor=BOTTOM);
  }
  //prismoid([80,6],[60,60], h=10);

}