include <BOSL2/std.scad>
include <BOSL2/rounding.scad>

diff(){
  zcyl(d=44, h=24, anchor=BOTTOM, $fn=128)
  attach(TOP) tag("remove") sphere(d=39.5);
}

/*
diff(){
  zcyl(d=44, h=24, anchor=BOTTOM, $fn=128)
  attach(TOP) tag("remove") sphere(d=40.4);
  tag("remove") zcyl(d=4, h=10, $fn=50);
}
*/