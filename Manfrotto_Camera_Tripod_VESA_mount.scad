//75, 25, 22.5


include <BOSL2/std.scad>
$fn=64;

linear_extrude(2)
VESA_plate();

rotate([0,90,90-22.5])
clip();

module VESA_plate(){
  difference() {
    union(){
      square([60,50], center=true);
      zrot_copies(n=4) {
        hull(){
          circle(d=15)move([75/2, 75/2]) circle(d=15);
        }
      }
    }
    grid_copies([75, 75], n=[2,2])
      circle(d=4);
  }
}


module clip() {
  difference(){
    tube(id=25, od=30, h=20, anchor=RIGHT);
    left(30) rotate([0,0,45]) cuboid([30,30,30]);
  }
}