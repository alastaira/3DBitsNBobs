include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=64;
epsilon = 0.05;

difference(){
  linear_extrude(5.5)
    difference(){
      square([20,20], anchor=CENTER);
      dshaft(6+epsilon,5+epsilon);
    }

  move_copies([[-5,-5], [5,5]]) {
    nut_trap_inline(1.6, "M2");
    zcyl(d=2.1, l=5.5, anchor=BOTTOM);
  }
  }


module dshaft(shaft_major_diam, shaft_minor_diam){
  intersection(){
    circle(d=shaft_major_diam);
    fwd(shaft_major_diam/2)
    square([shaft_major_diam, shaft_minor_diam], anchor=FRONT);
  }
}