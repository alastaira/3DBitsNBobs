include <BOSL2/std.scad>
include <BOSL2/threading.scad>
include <BOSL2/screws.scad>
$fn=64;

tube(id=24.5,od=27.5,h=25, anchor=BOTTOM);


diff(){
  tube(id=25,od=45,h=2, anchor=BOTTOM);
    
  zrot_copies(n=4,d=35){ 
   // cuboid([12,10,2], rounding=5, edges=[FRONT+RIGHT, BACK+RIGHT], anchor=BOTTOM+LEFT);
   # tag("remove") screw_hole("M3,2", head="flat", counterbore=0, orient=DOWN, anchor=TOP);
  } 
}