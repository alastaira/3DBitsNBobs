include <BOSL2/std.scad>
$fn=64;


//birdcage();





  path = turtle([
    "left", 180,
      "move", 360,
      "arcleft", 140, 180,
      "move", 360
  ]);
  stroke(path);






module birdcage(){
  path = turtle([
    "left", 180,
      "move", 360,
      "arcleft", 140, 180,
      "move", 360
  ]);


  // Wires
  zrot_copies(n=5){
    rotate([0,90,0])
    fwd(-140)
    path_sweep(circle(d=3), path, twist=12*360);
  }

  // Base
  cylinder(d=290, h=5);

  // Supports
  up(180)
  tube(od=290, id=270, h=5);
  up(360)
  tube(od=290, id=270, h=5);

  /*
  // Interior
  color("gray", 0.2)
  cylinder(d=280, h=360, anchor=BOTTOM)
  position(TOP)
  top_half()
  sphere(d=280);
  */
}
