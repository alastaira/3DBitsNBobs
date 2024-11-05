include <BOSL2/std.scad>

// See https://www.aliexpress.com/item/4000264402274.html
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
ymove(-5)
// Sensor mounts
xflip_copy(offset=-18) sensor_mount();

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