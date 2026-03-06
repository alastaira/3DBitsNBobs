include <BOSL2/std.scad>
include <BOSL2/rounding.scad>


tex = texture("trunc_diamonds");
difference(){
  // Base
  zcyl(d=40, h=4, anchor=BOTTOM, $fn=128)
  // Flange
  attach(TOP)
    zcyl(d1=40, d2=25, rounding2=4, h=5, anchor=BOTTOM) 
  // Knurled Edge
  attach(TOP)
    linear_sweep(circle(d=25), texture="diamonds", tex_size=[5,5], h=6, style="concave")
  // Cap
  attach(TOP)
    zcyl(d1=25, d2=20, rounding2=1, h=2, anchor=BOTTOM);
  // Flange Texturing
  up(5) zrot_copies(n=24) right(20) rotate([0,-54,0]) zcyl(d=3, h=8, anchor=BOTTOM);
  
  // Remove shaft
   scale([1.01, 1.01, 1]) D_shaft();
  // splined_shaft();
}


module D_shaft(){
  diff(){
    zcyl(d=6, h=10, anchor=BOTTOM, $fn=64)
    tag("remove") position(BACK) cuboid([6,1.5,10+.1], anchor=BACK);
  }
}


module splined_shaft(){
  //zcyl(d=6, h=10, anchor=BOTTOM, $fn=8);
  linear_extrude(10)
  star(n=18, d=6, step=2);
}
