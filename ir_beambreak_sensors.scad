include <BOSL2/std.scad>


// See https://www.aliexpress.com/item/4000264402274.html
/*
if($preview){
  color("#AAAAAA33", 0.5)
  cuboid([12,34,150]);
}
*/

/*
  diff(){
    cuboid([40,45,2]);
    tag("") cuboid([14,36,4], anchor=BOTTOM);
    tag("remove")cuboid([12,34,150]);
  }
*/
recolor("gray")
diff(){
  // Create base_plate with tapered opening for the sword
  rect_tube(size=[50,50], isize1=[16,38], isize2=[12,34], h=2, wall=1, anchor=TOP)
  // Screw holes
  tag("remove")grid_copies(n=[2,2], spacing=40) zcyl(d1=4.2, d2=3.5, h=2.1, $fn=32);

}
diff(){
  rect_tube(isize=[12,34], wall=1, h=11)
  tag("remove") position(TOP) cuboid([15,6,9], rounding=3, anchor=TOP, $fn=32, edges=[FRONT+BOTTOM, BACK+BOTTOM]);
}

recolor("darkgray")
  ymove(-5)
  // Sensor mounts
  xflip_copy(offset=-18) sensor_mount();
//position([FRONT+LEFT, FRONT+RIGHT, BACK+LEFT, BACK+RIGHT] )
//zcyl(d2=4.2, d1=3.5, h=2.1);




module sensor_mount(){
  diff(){
    rect_tube(isize=[7.2,18.2], wall=1, h=11){

      // Screw hole
      position(LEFT) move([0,-3,0]) tag("remove") xcyl(d=4, h=3, $fn=32);
    
      // Cutout for sensor
      position(RIGHT+TOP) move([0,5,0]) tag("remove") cuboid([3,6,9], rounding=3, anchor=TOP, $fn=32, edges=[FRONT+BOTTOM, BACK+BOTTOM]);
      
      // Cutout for wire
      position(FRONT+TOP) move([1.5,0,0]) tag("remove") cuboid([2,3,9], anchor=TOP); 
    }
  }
}




/*
blade = [34,12, 150];


//receiver 
transmitter = [ 18.2, 11, 7.2];
//blade();
rotate([0,0,-90])detector();


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
  position(BOTTOM) move([-3,0,0])
  tag("remove")zcyl(d=4, h=3, $fn=32, anchor=BOTTOM);    
  }  
  
}



}

module blade(){
  recolor("silver")
  cuboid(blade);
}
*/