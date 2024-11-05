include <BOSL2/std.scad>
$fn=64;

diff(){
zcyl(d=30, h=2);

tag("remove") zcyl(d=10, h=3);

xcopies(24, n=2)
tag("remove") zcyl(d=3, h=3);
  
tag("remove") cuboid([5,20,3], anchor=BACK);  

}