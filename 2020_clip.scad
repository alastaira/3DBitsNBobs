

include <BOSL2/std.scad>

include <BOSL2/threading.scad>
include <BOSL2/screws.scad>

/*
translate([-41.9,-112,-8])
rotate([0,0,-90])
import("C:\\Users\\alast\\Downloads\\LED Strip-clip 2020 Extrusion Tevo Tarantula - 2050079\\files\\stripshort.stl");


#xflip()
translate([-41.9,-112,-8])
  rotate([0,0,-90])
import("C:\\Users\\alast\\Downloads\\LED Strip-clip 2020 Extrusion Tevo Tarantula - 2050079\\files\\stripshort.stl");
*/
profile = [
  [-2.5, 0],
  [-2.5, 1.6],
  [-3.6, 1.6],
  [-3.6, 2.4],
  [-2.3, 5.85],
  [-.65, 5.85],
  [-.65, -3],
  [0, -3],
  [0, -15],
  [-3.5, -15],
  [-3.5, -2.5],
  [-5.5, -1.2],
  [-5.5, 0],
  
  
  [2.5, 0],
  [2.5, 1.6],
  [3.6, 1.6],
  [3.6, 2.4],
  [2.3, 5.85],
  [.65, 5.85],
  [.65, -3],
  [0, -3],
  [0, -15],
  [3.5, -15],
  [3.5, -2.5],
  [5.5, -1.2],
  [5.5, 0],
  ];

difference(){

linear_extrude(8)
  round2d(or=.5, ir=0.5, $fn=64 ){ polygon( profile ); }
  
 tag("remove") translate([0,-16,4]) rotate([90,0,0])
     screw_hole("M3,8",head="flat small", thread=true, anchor=TOP);
  //screw("#6", head="flat small",length=12,drive="slot");
}
  