include <BOSL2/std.scad>
include <BOSL2/nema_steppers.scad>
include <NopSCADlib/core.scad>
include <NopSCADlib/vitamins/pulleys.scad>
include <NopSCADlib/vitamins/belts.scad>
include <NopSCADlib/vitamins/stepper_motors.scad>

belt_length = 160;
motor_width= nema_motor_info(size=17)[0];
plate();
vitamins();

// Approximate centre-to-centre distance for a closed timing belt
// L  = belt length in mm
// N1 = teeth on pulley 1
// N2 = teeth on pulley 2
// p  = belt pitch in mm, default is 2mm
function belt_centre_distance(L, N1, N2, p=2) =
    let(
        A = L - (p / 2) * (N1 + N2),
        D = N2 - N1
    )
    (A + sqrt(A * A - (2 * p * p * D * D) / (PI * PI))) / 4;

    
C = belt_centre_distance(belt_length, 16, 48);
echo("Final centre distance", C);
D = 2*C + motor_width;
    
module plate() {
  diff(){
    cuboid([D+4,motor_width+4+0.4,3], chamfer=0, edges="Z", anchor=BOTTOM);
    fwd(motor_width/2+0.2) cuboid([D+4, 2, 6], anchor=TOP+BACK);
    back(motor_width/2+0.2) cuboid([D+4, 2, 6], anchor=TOP+FRONT);
    tube(id=8.1, h=5, od1=12.1, od2=14.1, anchor=TOP);
    tag("remove") left(C) nema_mount_mask(size=17, depth=5, l=6, spin=90, anchor=BOTTOM);
    tag("remove") zcyl(d=8.1, h=10);
    tag("remove") right(C) nema_mount_mask(size=17, depth=5, l=6, spin=90, anchor=BOTTOM);
  }
   //left(C) rect_tube(isize=[motor_width+0.2, motor_width+0.2], wall=2, h=10, anchor=TOP);
  //right(C) rect_tube(isize=[motor_width+0.2, motor_width+0.2], wall=2, h=10, anchor=TOP);

}


module vitamins() {
// Add vitamins for preview
if($preview) {
  //                                                 n       t   o      b         w    h  h    b     f    f  s   s    s              s
  //                                                 a       e   d      e         i    u  u    o     l    l  c   c    c              c
  //                                                 m       e          l         d    b  b    r     a    a  r   r    r              r
  //                                                 e       t          t         t            e     n    n  e   e    e              e
  //                                                         h                    h    d  l          g    g  w   w    w              w
  //                                                                                                 e    e                          s
  //                                                                                                         l   z
  //                                                                                                 d    t
  GT2x48_pulley_8          = ["GT2x48_pulley",        "GT2",   48, 30.05, GT2x6,  11,    24, 6,   8, 35,   1.0, 6, 3,  M3_grub_screw, 1]; // Powge branded from West3D
  GT2x48_pulley_6          = ["GT2x48_pulley",        "GT2",   48, 30.05, GT2x6,  11,    24, 6,   6, 35,   1.0, 6, 3,  M3_grub_screw, 1]; // Powge branded from West3D
  up(13){
  // Hour stepper
  left(C){
    pulley_assembly(GT2x16_pulley);
    translate([0,0,-15])
    NEMA(NEMA17_40);
  }
  // Shaft
  pulley_assembly(GT2x48_pulley_6);
  // Add the belt
  path = [
    [-C,0,6],             
    [0,0,15],
  ];
  belt(GT2x6, path, open = false);
  }

  // Minute stepper
  up(13){
    right(C){
      up(14)
      pulley_assembly(GT2x16_pulley);
      translate([0,0,-15])
      NEMA(NEMA17_40);    
    }
    // Shaft    
    up(14)
    pulley_assembly(GT2x48_pulley_8);
    // Add the belt
    path2 = [
      [C,0,6],             
      [0,0,15],
    ];
        up(14)
    belt(GT2x6, path2, open = false);
  }
}
}