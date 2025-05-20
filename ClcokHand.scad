include <BOSL2/std.scad>
$fn=100;

difference(){
chain_hull(){
  zcyl(d=3, h=1.2);
  right(2)
  zcyl(d=2.2, h=1.2);
  right(30)
  zcyl(d=0.4, h=1.2, anchor=LEFT);
}
zcyl(d=2, h=2);
cuboid([4, .4, 2], anchor=RIGHT);
}
/*
difference(){
  //tube(od=2.2, id=1, h=3, anchor=LEFT+BOTTOM);
 // cuboid([3,0.2,3.4], anchor=LEFT+BOTTOM);
}
*/