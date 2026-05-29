include <BOSL2/std.scad>
include <NopSCADlib/core.scad>
include <NopSCADlib/vitamins/pulleys.scad>
include <NopSCADlib/vitamins/belts.scad>
include <NopSCADlib/vitamins/stepper_motors.scad>

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


// Hour stepper
left(50){
  pulley_assembly(GT2x16_pulley);
  translate([0,0,-15])
  NEMA(NEMA17_40);
}
// Shaft
pulley_assembly(GT2x48_pulley_6);
// Add the belt
path = [
  [-50,0,6],             
  [0,0,15],
];
belt(GT2x6, path, open = false);


// Minute stepper
up(18){
  right(50){
    pulley_assembly(GT2x16_pulley);
    translate([0,0,-15])
    NEMA(NEMA17_40);    
  }
  // Shaft
  pulley_assembly(GT2x48_pulley_8);
  // Add the belt
  path2 = [
    [50,0,6],             
    [0,0,15],
  ];
  belt(GT2x6, path2, open = false);
}

