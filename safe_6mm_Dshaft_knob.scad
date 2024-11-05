include <BOSL2/std.scad>
include <BOSL2/rounding.scad>
//D_shaft();
tex = texture("trunc_diamonds");
difference(){
  zcyl(d=24, h=4, anchor=BOTTOM, $fn=128)
  
  //attach(TOP) zcyl(d1=18, d2=10, rounding2=4, h=10, anchor=BOTTOM)
  
  attach(TOP)
    linear_sweep(
      circle(d=24), texture="diamonds", tex_size=[5,5], h=10, style="concave")
  attach(TOP) zcyl(d1=24, d2=20, rounding2=1, h=1, anchor=BOTTOM);
  
  //up(5)
  //#zrot_copies(n=45) right(45) rotate([0,-45,0]) zcyl(d=3, h=12, anchor=BOTTOM);
  
  
  scale([1.04,1.04,1]) D_shaft();
}


module D_shaft(){
  diff(){
    zcyl(d=6, h=10, anchor=BOTTOM, $fn=64)
    tag("remove") position(BACK) cuboid([6,1.5,10+.1], anchor=BACK);
  }
}
