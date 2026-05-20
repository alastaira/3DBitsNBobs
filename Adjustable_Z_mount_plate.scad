include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=100;

difference(){
  linear_extrude(7.5)
  difference(){
    rect([64, 100], rounding=3, anchor=BOTTOM);
    back(80)
      grid_copies([23.4, 23.4], n=[3,2])
        rect([10.2, 8.1]);
    back(80)
      grid_copies([23.4,23.4], n=[2,2])
        circle(d=3.3);
    back(30){
    circle(d=4.2);
      grid_copies([20, 40], n=[2,2])
        circle(d=4.2);
    }
  }
  
  back(30){
    nut_trap_inline(2, "M5");
      grid_copies([20, 40], n=[2,2])
        nut_trap_inline(2, "M5");
    }
  
  
}