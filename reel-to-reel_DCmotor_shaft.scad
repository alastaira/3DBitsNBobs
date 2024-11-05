// 
// According to https://www.usdttmotor.com/tgp-motor/plastic-gearbox-plus-a130-dc-motor-tgp01d.html
// Dimensions should be 5.4/3.7
// 
include <BOSL2/std.scad>
$fn=100;

motor_width = 22.3;
motor_length = 64.5;


//motor_plate();

spindle();

/*
module motor_mount(){
circle(d=6);
translate([0,11.2+2.6]) circle(r=1.4);
translate([0,-31.8+11.2])
xcopies(17.5, n=2)
circle(d=3);
}
*/
module motor_plate(){
  linear_extrude(1.4)
  difference(){
    fwd(-11.2)
    rect([22,37], rounding=[3,3,1,1], anchor=TOP);

    circle(d=7.5);
    translate([0,-11.2]) circle(r=2.4);
    translate([0,11.2+2.6]) circle(r=1.4);
    translate([0,-31.8+11.2])
    xcopies(17.5, n=2)
      circle(d=3);
  }
  back(13.7)
  difference(){
    cuboid([5,5,9+1.4], anchor=BOTTOM);
    zcyl(d=3,h=10+1.4, anchor=BOTTOM);
  }
}

module spindle(){
  // Tape spindle
  linear_extrude(8) {
    union(){
      circle(d=12.8);
      rot_copies(n=3, delta=[6,0,0]){
        rect([4.5,2.5], rounding=[1.25,0,0,1.25], anchor=LEFT);
      }
    }
  }
  // Motor shaft
  up(8)
  linear_extrude(8) {
    difference(){
      circle(d=8);
      intersection(){
        circle(d=5.5, $fn=128, center=true);
        translate([0,0,0]) { square([5.5, 3.8], center=true); }
      }
    }
  }
}