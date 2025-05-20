include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=64;


pcb_thickness = 1.25;
pcb_underneath_clearance = 3;
pcb_over_clearance = 11;
bottom_wall_height = pcb_underneath_clearance + pcb_thickness;

/*
import("C:\\Users\\alast\\Downloads\\Bodem voor DY-HV20T Mp3 player.stl");
color("blue")
translate([-12,30,5])
*/
base();
//spacer();
//lid();
//dyhv20t();

module dyhv20t(){
color("blue")
  diff(){
    rect([50,50], rounding=2);
    tag("remove")
    grid_copies(n=2,spacing=[45,45])
    #circle(d=3.1);
  }
}

module spacer(){
  tube(id=3.1, od=5.1, h=11);

}

module base() {
  diff() {
    // Bottom
    cuboid(size=[54,54,1], rounding=1, edges="Z", anchor=BOTTOM){
      attach(TOP) {
        // Sides
        rect_tube(size=[54,54],isize=[51,51],h=bottom_wall_height, rounding=1);
        // Mounts
        grid_copies(n=2,spacing=[45,45]) {
          cuboid([7,7,pcb_underneath_clearance], anchor=BOTTOM);
          tag("remove") zcyl(h=33,d=pcb_underneath_clearance, anchor=BOTTOM);
        }
      }
      position(BOTTOM+FRONT){
        // Tabs
        cuboid([10,10,1], rounding=5, edges=[FRONT+LEFT, FRONT+RIGHT], anchor=BOTTOM+BACK);
        tag("remove") fwd(5) zcyl(h=33,d=pcb_underneath_clearance, anchor=BOTTOM);
      }
      position(BOTTOM+BACK){
        // Tabs
        cuboid([10,10,1], rounding=5, edges=[FRONT+LEFT, FRONT+RIGHT], anchor=BOTTOM+BACK, spin=180);
        tag("remove") back(5) zcyl(h=33,d=pcb_underneath_clearance, anchor=BOTTOM);
      }
    }
    // Nut traps
    grid_copies(n=2,spacing=[45,45])
    translate([0,0,-0.01])
      tag("remove") zcyl(h=2.5, d=6.4, $fn=6, anchor=BOTTOM);
    }
    
    

    
}





module lid() {
  diff() {
    // Top
    cuboid(size=[54,54,1], rounding=1, edges="Z", anchor=BOTTOM)
    //attach(TOP) {
    // Sides
    //rect_tube(size=[54,54],isize=[51,51],h=bottom_wall_height, rounding=1);
    /*
    // Mounts
    grid_copies(n=2,spacing=[45,45]) {
        cuboid([9,9,pcb_over_clearance], anchor=BOTTOM, rounding=1, edges="Z");
       //tag("remove") zcyl(h=33,d=pcb_underneath_clearance, anchor=BOTTOM);
        }
        */
    //}
    attach(TOP)
    // Nut traps
    grid_copies(n=2,spacing=[45,45])
    tag("remove") screw_hole("M3,12",head="none",counterbore=0, anchor=TOP);
  }
}
