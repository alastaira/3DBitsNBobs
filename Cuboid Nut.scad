include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=64;

//screw("M3,12",  head="flat small", drive="slot");

//top_half()
diff(){
//color("white",0.7)
  cuboid([16,16,16]){
  position(BOTTOM) down(6.5)
  tag("remove")hole();
  position(LEFT)  left(6.5) orient(RIGHT)
 tag("remove")hole();
  position(BACK) back(6.5) orient(FORWARD)
  tag("remove")hole();
 tag("remove")sphere(d=9.5);
  }
  /*
position(BOTTOM)
down(5)
screw_hole("M3,12",  head="flat small", anchor=BOTTOM);
*/

}



module hole(){
  cyl(d=3.2, l=8.6, anchor=BOTTOM)
  align(TOP)
  cyl(d1=3, d2=6, l=2.5, anchor=BOTTOM)
  align(TOP)
  cyl(d=6, l=18, anchor=BOTTOM);
}