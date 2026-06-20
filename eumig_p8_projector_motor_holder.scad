include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=100;


ring_support();


module top_support(){
  diff(){
    chain_hull(){
      move_copies([[-55/2, 0, 0], [55/2, 0, 0]]){
        tube(od=16, id=8.1, h=4);
      }
      tube(od=34, id=18, h=4);
    }  
    tag("remove") { 
      move_copies([[-55/2, 0, 0], [55/2, 0, 0]]) { cyl(d=8.1, h=5); }
      cyl(d=18, h=4);
      move_copies([[-29/2, 0], [29/2, 0]]) { cyl(d=4, h=5); }
    }
  }
}

module ring_support(){
  diff(){
    chain_hull(){
      move_copies([[-55/2, 0, 0], [55/2, 0, 0]]){
        tube(od=16, id=8.1, h=4);
      }
      tube(od=54, id=44, h=4);
    }
    tag("remove") {
      move_copies([[-55/2, 0, 0], [55/2, 0, 0]]) { cyl(d=8.2, h=5); }
      cyl(d=43.2, h=4);
    }
  }
}


module base_support(){
  diff(){
  union(){
    tube(od=70, id = 44, h=5);
    cuboid([30, 60, 5]);}
    tag("remove") { 
      move_copies([[-55/2, 0, 0], [55/2, 0, 0]]) { cyl(d=8.1, h=5); }
      cyl(d=18, h=5);
      }
    }
  }
