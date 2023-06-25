
include <BOSL/constants.scad>
use <BOSL/masks.scad>

$fn=100;
//chamfer(chamfer=5, size=[105,198,10]) {
difference(){
    cube([105,198,4.5], center=true);
    cube([73,166,4.5], center=true);
    translate([0,0,1])
        cube([90,180,3.5], center=true);
  
  for(y=[-91,91], x=[-44.5,44.5]){
    translate([x,y,0])
      cylinder(h=12,d=4.1, center=true);
  }
}
/*
difference(){
    cube([105,198,1], center=true);
    cube([73,166,1], center=true);
}
*/


//182, 57.5