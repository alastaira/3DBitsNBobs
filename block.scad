include <BOSL2/std.scad>
include <BOSL2/threading.scad>
$fn=64;

/*
Thread Pitch
M1 	0.25
M2 	0.40
M3 	0.50 
M4 	0.70
M5 	0.80
*/



diff("hole"){
  cuboid(10);
  tag("hole")threaded_rod(
    d=3, l=11, pitch=.5, $fn=36,
    internal=true, bevel=true,
    blunt_start=false,
    teardrop=false, orient=FWD
  );
  tag("hole")threaded_rod(
    d=3, l=11, pitch=.5, $fn=36,
    internal=true, bevel=true,
    blunt_start=false,
    teardrop=false, orient=UP
  );
  tag("hole")threaded_rod(
    d=3, l=11, pitch=.5, $fn=36,
    internal=true, bevel=true,
    blunt_start=false,
    teardrop=false, orient=RIGHT
  );   
}





   // tag("hole")xcyl(h=11, d=4.1)
   // tag("hole")ycyl(h=11, d=4.1);
   
   
   /*
   difference() {
  cuboid(50);
  threaded_rod(
      d=25, l=51, pitch=4, $fn=36,
      internal=true, bevel=true,
      blunt_start=false,
      teardrop=true, orient=FWD
  );
}
*/