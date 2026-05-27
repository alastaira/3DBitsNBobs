include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=100;

difference(){

  rotate([90,0,0])
  linear_extrude(70)
  polygon([[0,0], [33.4, 0], [33.4,3], [32.9, 4.5], [33.4, 6], [33.4, 8.5],
  [0, 8.5], [0,6], [0.5, 4.5], [0, 3], [0,0]]);
  
  translate([33.4/2, -70/2, 0])
  #grid_copies(spacing=6, n=[8,11], stagger=true) cylinder(d=4, h=8.5);
  

}