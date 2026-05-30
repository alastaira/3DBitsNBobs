include <BOSL2/std.scad>
include <BOSL2/nema_steppers.scad>
include <NopSCADlib/core.scad>
include <NopSCADlib/vitamins/pulleys.scad>
include <NopSCADlib/vitamins/belts.scad>
include <NopSCADlib/vitamins/stepper_motors.scad>


diff(){
  cuboid([180,50,3], rounding=2, edges="Z");
  //tube(id=8.1, h=5, od=10.1, anchor=BOTTOM);
  tag("remove") left(67) nema_mount_mask(size=17, depth=5, l=6, spin=90);
  tag("remove") zcyl(d=8.1, h=10);
  tag("remove") right(67) nema_mount_mask(size=17, depth=5, l=6, spin=90);
}

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
left(67){
  pulley_assembly(GT2x16_pulley);
  translate([0,0,-15])
  NEMA(NEMA17_40);
}
// Shaft
pulley_assembly(GT2x48_pulley_6);
// Add the belt
path = [
  [-67,0,6],             
  [0,0,15],
];
belt(GT2x6, path, open = false);
}

// Minute stepper
up(13){
  right(67){
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
    [67,0,6],             
    [0,0,15],
  ];
      up(14)
  belt(GT2x6, path2, open = false);
}
}
