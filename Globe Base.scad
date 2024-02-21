include <BOSL2/std.scad>
$fn=64;
// 88 93

//screw_spacing = 54; // in B25
screw_spacing = 51.8; // in 12V

globe_base();
/*
move([0,0,27])
strain_relief();
*/
module globe_base(){
  // Main body
  diff(){
    tube(od=96, id=94, h=25, $fn=64, anchor=BOTTOM)
    position(TOP)
    tag("remove") cuboid([6,88,8], anchor=TOP+FRONT);
  }
  
  // Locking nuts
  intersection(){
    zrot_copies(n=3, d=88) cuboid([8,15,12], rounding=1, edges=[TOP+LEFT,TOP+FRONT,TOP+BACK], anchor=BOTTOM+LEFT);
    zcyl(d=96,h=12, anchor=BOTTOM);
  }

  //Base
  move([0,0,25])
  diff(){
    zcyl(d=96, h=2, anchor=BOTTOM);
    tag("remove") zcyl(d=35, h=2, anchor=BOTTOM);
    // Screw holes
    tag("remove") xcopies(screw_spacing) zcyl(d2=5.5, d1=4.1,h=2.1, anchor=BOTTOM);
    
  }
  
}

module strain_relief(){
  #tube(od=96, id=94, h=4, $fn=64, anchor=BOTTOM)
  //position(TOP)
 // zcyl(d=96, h=2, anchor=TOP);
  
  cuboid([48,8,4]);
  
}