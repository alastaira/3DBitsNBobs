include <BOSL2/std.scad>
$fn=64;

diff(){
  cuboid([1,15,15], rounding=4, edges=[BACK+TOP, BACK+BOTTOM]);
  tag("remove") xcyl(d=12, h=1.01);
}

path = turtle([
    "move", 14,
    "arcleft", 1, 180,
    "move", 14
]);
move([0,-9.5,-7.5])
linear_extrude(15)

stroke(path, width=1);