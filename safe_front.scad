include <BOSL2/std.scad>
$fn=100;

diff(){
  cuboid([148.5, 98.3, 1], rounding=3, edges="Z"){
    align(TOP) grid_copies(spacing=[98,88]) tube(id=2.8, od=6, h=3.5);
    tag("remove") translate([42,33,0]) position(BOTTOM+LEFT+FRONT) cylinder(d=47, h=10);
    tag("remove") translate([81,33,0]) position(BOTTOM+LEFT+FRONT) cylinder(d=13.3, h=10);
    tag("remove") translate([118,15,0]) position(BOTTOM+LEFT+FRONT) xcopies(n=3,spacing=12) cylinder(d=5.2, h=10);
  }
}