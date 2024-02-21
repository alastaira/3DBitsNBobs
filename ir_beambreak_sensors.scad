include <BOSL2/std.scad>

// See https://www.aliexpress.com/item/4000264402274.html

blade = [34,12, 150];


//receiver 
transmitter = [ 18.2, 11, 7.2];
//blade();
detector();


module detector(){
  move([0,0,-6.5])
  diff(){
    cuboid([40,45,2]);
    tag("") cuboid([36,14,4], anchor=BOTTOM);
    tag("remove")cuboid(blade);
  }

  move([-3,17.9,-5.5])
  diff(){
    cuboid([20,9.2,3], anchor=BOTTOM);
    tag("remove")cuboid([18.2,7.2,4], anchor=BOTTOM);
  }
    move([-3,22.5,0]) {
  rotate([90,0,0])
    diff(){

  cuboid([20,11,8], anchor=BOTTOM){
  position(TOP)
  tag("remove")cuboid(transmitter, anchor=TOP);
  position(LEFT)
  tag("remove")cuboid([2,11,4], anchor=BOTTOM);
  position(BOTTOM) move([-3,0,0])
  tag("remove")zcyl(d=4, h=3, $fn=32, anchor=BOTTOM);    
  }
}}

  move([-3,-12.9,-5.5])
  diff(){
    cuboid([20,9.2,3], anchor=BOTTOM);
    tag("remove")cuboid([18.2,7.2,4], anchor=BOTTOM);
  }


  move([-3,-17.5,0]) mirror([0,1,0]) rotate([90,0,0]) 
diff(){
  cuboid([20,11,8], anchor=BOTTOM){
  position(TOP)
  tag("remove")cuboid(transmitter, anchor=TOP);
  position(LEFT)
  tag("remove")cuboid([2,11,4], anchor=BOTTOM);
  position(BOTTOM) move([-2,0,0])
  tag("remove")zcyl(d=4, h=3, $fn=32, anchor=BOTTOM);    
  }  
  
}



}

module blade(){
  recolor("silver")
  cuboid(blade);
}