include <BOSL2/std.scad>
include <BOSL2/rounding.scad>

difference(){
  zcyl(d=24, h=4, anchor=BOTTOM, $fn=128)
  attach(TOP)
    linear_sweep(
      circle(d=24), texture="diamonds", tex_size=[5,5], h=10, style="concave")
  attach(TOP) zcyl(d1=24, d2=20, rounding2=1, h=1, anchor=BOTTOM);
  scale([1.04,1.04,1]) D_shaft();
}

module D_shaft(){
  diff(){
    zcyl(d=6, h=10, anchor=BOTTOM, $fn=64)
    tag("remove") position(BACK) cuboid([6,1.5,10+.1], anchor=BACK);
  }
}