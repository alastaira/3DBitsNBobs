include <BOSL2/std.scad>
include <BOSL2/threading.scad>
include <BOSL2/screws.scad>
$fn=64;

tube(id=35,od=40,h=30, anchor=BOTTOM);

zrot_copies(n=4,d=35){
  diff(){
    cuboid([12,10,2], rounding=5, edges=[FRONT+RIGHT, BACK+RIGHT], anchor=BOTTOM+LEFT);
    tag("remove") move([7,0,0]) screw_hole("M3,2", head="flat", counterbore=0, orient=UP, anchor=BOTTOM);
  } 
}