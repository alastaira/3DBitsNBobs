//75, 25, 22.5


include <BOSL2/std.scad>
$fn=64;

linear_extrude(3)
VESA_plate();
up(.25)
rotate([0,90,90-20])

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
    tube(id=24.5, od=30, h=30, anchor=RIGHT);
    left(36) rotate([0,0,45]) cuboid([30,30,30]);
  }
}