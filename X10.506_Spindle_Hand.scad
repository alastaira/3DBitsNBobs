include <BOSL2/std.scad>
$fn=64;

hour_hand();
fwd(10) minute_hand();

module minute_hand(){
  diff(){
    chain_hull(){
      left(22) cuboid([3,3,1], anchor=BOTTOM);
      left(20) zcyl(d=3, h=1, anchor=BOTTOM);
      right(8)zcyl(d=1, h=1, anchor=BOTTOM);
    }
    left(20){
      tube(id=1.5, od=2.8, h=4, $fn=32, anchor=BOTTOM);
    }
  }
}

module hour_hand(){
  diff(){
    chain_hull(){
      left(22) cuboid([3,3,1], anchor=BOTTOM);
      left(20) zcyl(d=4, h=1, anchor=BOTTOM);
      right(0)zcyl(d=1, h=1, anchor=BOTTOM);
    }
    left(20) tag("remove") zcyl(d=2.8,h=2, anchor=BOTTOM);
    left(20){
      tube(id=2.5, od=3.2, h=4, $fn=32, anchor=BOTTOM);
    }
  }
}

module hand(){
  diff(){
    hull(){
      left(20)circle(d=5);
      right(20)circle(d=5);
    }
    
    tag("remove") { 
      left(20) union(){
        circle(d=1.1);
        square([4, .3], anchor=RIGHT);
      }
      right(20) union(){
        circle(d=2.1);
        square([4, .3], anchor=LEFT);
      }
    } 
  }
}
