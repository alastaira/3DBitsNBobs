include <BOSL2/std.scad>
$fn=100;

// RC320 Mini 24mm Round Cylindrical Vibrating Motor DC 5V 6V 7.2V 9V 12V Strong Vibration Eccentric wheel
// https://www.aliexpress.com/item/1005006161233137.html?spm=a2g0o.order_list.order_list_main.51.7813180259UpbB


plug();
// motor_unit();
//sensor_unit();



module plug() {
  tube(od=85, id=55, h=1, anchor=BOTTOM);
  tube(od=55, id=53, h=60, anchor=BOTTOM);
}

module motor_unit() {
  tube(od=53, id=51, h=5, anchor=BOTTOM);
  diff(){
    tube(od=53, id=25, h=2, anchor=BOTTOM);
    tag("remove")
    zrot_copies(n=3, r=15.3)
    zcyl(d=2.8, h=2, anchor=BOTTOM);
  }
}


module sensor_unit(){
  // Fixing ring
  tube(id=55, od=57, h=3, anchor=BOTTOM);

  // Side supports
  difference() {
    fwd(5) cuboid([79.2,20.2,3], anchor=BOTTOM);
    zcyl(d=55, h=10);
  }

  // Sensor mounts
  xflip_copy(offset=-35/*-32.5*/) fwd(5) up(3) sensor_mount();

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
}