include <BOSL2/std.scad>
include <BOSL2/gears.scad>
$fn=100;


// Stepper Motor Properties
MBH = 18.8;   // motor body height
MBD = 28.25;  // motor body OD
SBD = 9.1;    // shaft boss OD
SBH = 1.45;   // shaft boss height above motor body
SBO = 7.875;  // offset of shaft/boss center from motor center
SHD = 4.93;   // motor shaft OD
SHDF = 3.0;   // motor shaft diameter, across flats
SHHF = 6.0;   // motor shaft flats height, or depth in from end
SHH = 9.75;   // height of shaft above motor body 

MBFH = 0.7;   // height of body edge flange protruding above surface
MBFW = 1.0;   // width of edge flange
MBFNW = 8;    // width of notch in edge flange
MBFNW2 = 17.8;  // width of edge flange notch above wiring box

MHCC = 35.0;  // mounting hole center-to-center
MTH  = 0.8;   // mounting tab thickness
MTW  = 7.0;   // mounting tab width
WBH  = 16.7;  // plastic wiring box height
WBW  = 14.6;  // plastic wiring box width
WBD  = 31.3;  // body diameter to outer surface of wiring box

WRD = 1.0;     // diameter of electrical wires
WRL = 30;      // length of electrical wires
WRO = 2.2;		// offset of wires below top motor surface

eps = 0.05;   // small number to avoid coincident faces


offset = gear_dist(circ_pitch=3.8,12,0);

union(){
color("darkgray"){
  
  difference(){
    union(){
      // Backplate
      left(5.5)up(5)fwd(7.5)
      cuboid([2,50,16.3], anchor=TOP);
      // Main block
      up(-3.15) fwd(3) cuboid([11.5,20,16.3]);
      // Cylinder to grab aerial
      up(5) tube(id=9.6, od=11.5, h=25, anchor=BOTTOM);
      // Slight interior riser to prevent cog hitting base of aerial
      up(5) tube(id=4, od=11.5, h=4, anchor=BOTTOM);
    }
    fwd(offset) xcyl(d=5.5, h=20.1);
    zcyl(d=4, h=30.1);
    cuboid([4,16,60.1], anchor=BACK);

    left(5.5)up(5)fwd(7.5) {
    down(5) xcyl(d=10, h=2);
    translate([5,17.5,-13]) xcyl(d=4, h=20);
    translate([5,-17.5,-13]) xcyl(d=4, h=20);}
  }


  
  
}
}
//gear();

module gear(){
  
  offset = gear_dist(circ_pitch=3.8, 12, 0);
  expand = 0.1;

  fwd(offset){
  difference(){
    spur_gear(circ_pitch=3, clearance=0, teeth=12, thickness=3.2, orient=RIGHT) ;

    intersection() {
      xcyl(d=SHD+expand, h=3.2, $fn=40);
      cube([3.2,SHHF+expand,SHDF+expand],center=true);
    }
    

  }
      difference(){
      tube(od=15,id=6, h=3.2, orient=RIGHT);
      torus(d_min=3.6, d_maj=14.6, orient=RIGHT);
    }
}}

/*
fwd(7.6)left(16)down(SBO)
rotate([90,-90,-90])
StepMotor28BYJ();
*/



module StepMotor28BYJ() {
  difference(){
    union(){
	   color("LightGray") translate([0,0,-(MBH+MBFH)/2])
		  difference() {  // flange at top rim
         cylinder(h = MBFH+eps, r = MBD/2, center = true, $fn = 50);
         cylinder(h = MBFH+2*eps, r = (MBD-MBFW)/2, center = true, $fn = 32);
			cube([MBFNW,MHCC,MBFH*2],center=true); // notches in rim
			cube([MBD+2*MBFW,SBD,MBFH*2],center=true);
		   translate([-MBD/2,0,0]) cube([MBD,MBFNW2,MBFH*2],center=true);
        }
		color("LightGray") // motor body
			cylinder(h = MBH, r = MBD/2, center = true, $fn = 100);
		color("LightGray") translate([SBO,0,-SBH])	// shaft boss
			cylinder(h = MBH, r = SBD/2, center = true, $fn = 32);

		translate([SBO,0,-SHH])	// motor shaft
      difference() {
        color("gold") cylinder(h = MBH, r = SHD/2, center = true, $fn = 32);
				// shaft flats
        translate([(SHD+SHDF)/2,0,-(eps+MBH-SHHF)/2]) 
				cube([SHD,SHD,SHHF], center = true);
        translate([-(SHD+SHDF)/2,0,-(eps+MBH-SHHF)/2]) 
				cube([SHD,SHD,SHHF], center = true);
      }

		color("Silver") translate([0,0,-(MBH-MTH-eps)/2]) // mounting tab 
			cube([MTW,MHCC,MTH], center = true);				
		color("Silver") translate([0,MHCC/2,-(MBH-MTH)/2]) // mt.tab rounded end
			cylinder(h = MTH, r = MTW/2, center = true, $fn = 32);
		color("Silver") translate([0,-MHCC/2,-(MBH-MTH)/2]) // mt.tab rounded end
			cylinder(h = MTH, r = MTW/2, center = true, $fn = 32);

		color("DeepSkyBlue") translate([-(WBD-MBD),0,eps-(MBH-WBH)/2]) // plastic wire box
			cube([MBD,WBW,WBH], center = true);
	   color("DeepSkyBlue") translate([-2,0,0])	
			cube([24.5,16,15], center = true);
		}

    // mounting holes in tabs on side
		translate([0,MHCC/2,-MBH/2])	
				cylinder(h = 2, r = 2, center = true, $fn = 32);
		translate([0,-MHCC/2,-MBH/2])	
				cylinder(h = 2, r = 2, center = true, $fn = 32);
		}
	}