include <BOSL2/std.scad>
$fn=64;


diff(){
  cuboid([165,165,.8], anchor=BOTTOM);
  tag("remove") {
    grid_copies(spacing=10, n=[16,16], stagger=false){
      // LEDs
      cuboid([5.2,5.2,1], anchor=BOTTOM);
      
      // Capacitor
      fwd(5)right(.75)
      cuboid([3.5,3.5,.5], anchor=BOTTOM);
    }  
  }
}