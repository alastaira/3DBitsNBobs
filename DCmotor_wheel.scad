// https://www.usdttmotor.com/tgp-motor/plastic-gearbox-plus-a130-dc-motor-tgp01d.html

// Libraries
//include <nutsnbolts//cyl_head_bolt.scad>;
//include <Round-Anything//polyround.scad>;
include <onewheel\onewheel.scad>;

// Create the wheel

difference(){
    wheel();
    intersection(){
        cylinder(r=5.3 / 2, h=8, $fn=40, center=true);
        translate([0, 0, 0]) { cube([3.7, 5.3, 8], center=true); }
    }
}