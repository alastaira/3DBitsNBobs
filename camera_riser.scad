use <threads-scad/threads.scad> ;
//include <nutsnbolts/examples.scad>;
$fn=64;
 
difference(){
ScrewHole(25.4*0.25, 15, position=[0,0,0], rotation=[0,0,0], pitch=1.27, tooth_angle=30, tolerance=0.4, tooth_height=0){
  translate([-10,-20])
  cube([20,40,20]);
}
translate([0,10])
  cylinder(h=20,d=6.5);
translate([0,10,0])
  cylinder(h=6.5,d=9.6);

}

/*
difference(){
  
  //
ScrewThread(25.4*.25, 10, position=[0,0,0], rotation=[0,0,0], pitch=0, tooth_angle=30, tolerance=0.4, tooth_height=0);

}
*/
//
/*
*/

/*
include <BOSL2/constants.scad>
use <BOSL2/threading.scad>;

trapezoidal_threaded_rod(d=3/8*25.4, l=20, pitch=1/8*25.4, thread_angle=29, $fn=32);
*/