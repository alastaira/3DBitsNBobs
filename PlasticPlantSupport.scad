include <BOSL2/std.scad>

exterior();

module interior(){
difference(){

  union(){
    linear_extrude(8)
    difference(){
      union(){
        circle(d=8, $fn=100); 
        square([8,8], anchor=LEFT);
      }
      circle(d=4.5, $fn=100);
    }
    move([8,0,8/2])
    xcyl(d=26,h=5,anchor=RIGHT,$fn=100);
  }
  move([8,0,8/2])
  //#xcyl(d=5,h=1.2,anchor=RIGHT, $fn=100);
  #teardrop(d=20.1, h=4, ang=60, cap_h=20, $fn=100, spin=90,anchor=FRONT);
  }
}
  
module exterior() {
  difference(){
    zcyl(d=26, h=5, $fn=100, anchor=BOTTOM);
    teardrop(d=20.1, h=4, ang=60, cap_h=20, $fn=100, orient=FORWARD, anchor=FRONT);
  }
}