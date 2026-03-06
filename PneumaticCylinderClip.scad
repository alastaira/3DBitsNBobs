include <BOSL2/std.scad>
include <BOSL2/screws.scad>

$fn=64;

cyl_d = 13;
nut_d = 15;
tab_l = 10;
clip_h = 10;
clip_thickness = 2;

// Define the clip profile
path = turtle([
  "move", tab_l,
  "left", 90, 
  "move", nut_d/2,
  "arcright", cyl_d/2 + clip_thickness/2, 180,
  "move", nut_d/2,
  "left", 90,
  "move", tab_l,
]);


diff(){
  linear_extrude(clip_h)
  stroke(path, clip_thickness);
 
  move_copies([[tab_l/2,0,clip_h/2], [tab_l+cyl_d+clip_thickness+tab_l/2,0,clip_h/2],])
  #screw_hole("M3x1,10",head="flat",counterbore=0,atype="head", anchor="head_bot", orient=BACK); 
  
}