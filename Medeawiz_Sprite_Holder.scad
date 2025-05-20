include <BOSL2/std.scad>
$fn=100;

difference(){
  cuboid([5,65.5,18]);
  cuboid([5,63.5,16]);
}

// Supports
move_copies([[7.5,-65.5/2 +5,-9], [7.5,65.5/2-5,-9]]) 
difference(){
  cuboid([12,10,1], rounding=5, edges=[RIGHT+FRONT, RIGHT+BACK], anchor=BOTTOM);
  cylinder(d=3.5, $fn=100);
}