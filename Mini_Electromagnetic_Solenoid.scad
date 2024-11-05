include <BOSL2/std.scad>
include <BOSL2/threading.scad>

include <BOSL2/screws.scad>
$fn=64;

// https://vi.aliexpress.com/item/1005002622008334.html




fwd(6)
plate();




//solenoid();


module solenoid(){
  color("silver")
  cuboid([15.7,10,8.3]){
    attach(LEFT)
    threaded_rod(d=5, l=4.8, pitch=.7, anchor=BOTTOM)
    attach(TOP)
    cyl(d=4, h=4.8, anchor=BOTTOM);
  attach(FRONT){
    move_copies([[-5/2,-3.5/2],[5/2,3.5/2]]) cylinder(d=3.5,h=2);
    //tag("remove")move_copies([[-5/2,3.5/2],[5/2,-3.5/2]]) cylinder(d=2,h=2);
  }
    
  }
}


module plate(){
  diff(){
    cuboid([23,2,10]) { 
      position(LEFT+BACK) 
        cuboid([3,12,10], anchor=BACK)
      attach(RIGHT)
        tag("remove") //xcyl(d=3.2,h=10);
      screw_hole("M3,8",head="flat",counterbore=0,anchor=TOP);
      
      attach(FRONT){
        tag("remove")move_copies([[-5/2,-3.5/2],[5/2,3.5/2]]) cylinder(d=4,h=5, anchor=TOP);
      }
    }
  }
}


/*
module plate(){
  diff(){
    cuboid([25,2,10]) { 
      position(LEFT+BACK) cuboid([3,10,10], anchor=BACK);
      
      
      
      attach(FRONT){
        tag("remove")move_copies([[-5/2,-3.5/2],[5/2,3.5/2]]) cylinder(d=3.6,h=5, anchor=TOP);
      }
    }
  }
}
*/