include <BOSL2/std.scad>
$fn=100;

epsilon = 0.4;

diff(){
  rect_tube(size=[154, 108], isize=[142, 96], h=4, anchor=BOTTOM, rounding=2, irounding=2);

  tag("remove")
  up(1)
  rect_tube(size=[150+epsilon,104+epsilon], isize=[146-epsilon,100-epsilon], h=100, anchor=BOTTOM);
}
//box();

/*
difference(){
  cuboid([154, 108, 4]);
*/
/*
  path = [[0,0], [150,0], [150,104], [0,104], [0,0]];
  stroke(path,width=2, closed=true, joints="butt");
*/
module box() {
color([0.7, 0.7,  0.7, 0.5])
cuboid([150, 104, 2], anchor=BOTTOM);

color([1, 0.7,  0.7, 0.5])
translate([0, 50,2]) rot([90,0,0])
cuboid([150, 100, 2], anchor=FRONT+TOP);


color([0.7, 1,  0.7, 0.5])
translate([0, -50,2]) rot([90,0,0])
cuboid([150, 100, 2], anchor=FRONT+BOTTOM);


color([0.7, 0.7,  1, 0.5])
translate([75, 0,52]) rot([0,90,0])
cuboid([100, 100, 2], anchor=TOP);


color([1, 0.7,  1, 0.5])
translate([-75, 0,52]) rot([0,90,0])
cuboid([100, 100, 2], anchor=BOTTOM);


}
