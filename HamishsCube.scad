include <BOSL2/std.scad>


diff() {
  cuboid([25, 25, 25]){
    tag("remove") attach(TOP) cyl(d=5.2, h=1.4, $fn=64, anchor=TOP);
    tag("remove") attach(RIGHT) cyl(d=5.2, h=1.4, $fn=64, anchor=TOP);
    tag("remove") attach(LEFT) cyl(d=5.2, h=1.4, $fn=64, anchor=TOP);
    tag("remove") attach(FRONT) cyl(d=5.2, h=1.4, $fn=64, anchor=TOP);
    tag("remove") attach(BACK) cyl(d=5.2, h=1.4, $fn=64, anchor=TOP);
    tag("remove") attach(BOTTOM) cyl(d=5.2, h=1.4, $fn=64, anchor=TOP);
  }
}