/*
cube([12, 32, 3.5]);
translate([(12-9.5)/2,4,3.5])
cube([9.5, 20,1.2]);
translate([0,32,0])
rotate([0,90,0])
linear_extrude(12) polygon([[0,0], [-3.5,0], [-3.5,3.5]]);
*/


cube([9.5, 32, 3.5]);
translate([(9.5-7.5)/2,4,3.5])
cube([7.5, 20,1.2]);
translate([0,32,0])
rotate([0,90,0])
linear_extrude(9.5) polygon([[0,0], [-3.5,0], [-3.5,3.5]]);