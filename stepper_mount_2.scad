//!OpenSCAD
// Number of motors
motors = 1; // [1:1:25]
// Distance between motor mounts
gap = 25; // [0:No Gap, 25:25mm Gap]
// Size of screw holes in mm
hole_size = 3.5; // [3:0.1:5]

build();

module build(){
  difference(){
    frame();
    holes();
  }
}

module frame(){
  translate([0,0,5])cube([50,3,47]);
 translate([50,0,13.5+5]) cube([40,3,20]);
}
module holes(){
    translate([25,3,28.5])rotate([90,0,0])cylinder($fn=128, r=12, h=7);
    translate([9.5,3,44])rotate([90,0,0])cylinder($fn=32, r=hole_size/2, h=7);
    translate([9.5,3,13])rotate([90,0,0])cylinder($fn=32, r=hole_size/2, h=7);
    translate([40.5,3,13])rotate([90,0,0])cylinder($fn=32, r=hole_size/2, h=7);
    translate([40.5,3,44])rotate([90,0,0])cylinder($fn=32, r=hole_size/2, h=7);
  
    translate([60,3,28.5])rotate([90,0,0])cylinder($fn=32, r=5.1/2, h=7);  
    translate([80,3,28.5])rotate([90,0,0])cylinder($fn=32, r=5.1/2, h=7);  
  
}
