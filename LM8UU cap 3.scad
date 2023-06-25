

/*
LM8UU is 24mm high x 15mm across, with 8mm hollow in centre

Wood is 18.5mm thick

2.4mm internal

*/
//Width of the flange
flangeWidth = 34;

//Radius of the screw holes
holeRad = 1.5;

//Distance of screw holes from center
holeDist = 12;

//Punch a screw hole every n degrees
screwDegrees = 180;

//Angle of screw head agaginst flange [ex. tan(40) = rise / run; rise = tan(40)*run]
screwAngle = 40;
//Thickness of the flange walls
wallThick = 1;



$fn=100;
difference(){
  union(){
    cylinder(h=6,d=17);
    difference() {
        rotate([0,0,45])
        translate([0,0,+wallThick/2])
        cube([flangeWidth, 10, wallThick], true);
        translate([0,0,+wallThick])
        cutHoles(screwDegrees=screwDegrees, holeDist=holeDist, screwAngle=screwAngle, holeRad=holeRad, wallThick=wallThick);
    }
  }
  cylinder(h=5+0.01, d=15.2);
  cylinder(h=6+0.01, d=10);
}

module cutHoles(){
    screwCutDepth = tan(screwAngle)*holeRad*2;
    for (r=[45:screwDegrees:359+45])
        rotate([0,0,r])
            translate([holeDist, 0, 0]){
            cylinder(r=holeRad, h=wallThick*3, center=true);
            translate([0,0,0-screwCutDepth+.001]) cylinder(r1=0, r2=holeRad*2, h = screwCutDepth);
            translate([0,0,0]) cylinder(r=holeRad*2, h = wallThick);
            }
    
}