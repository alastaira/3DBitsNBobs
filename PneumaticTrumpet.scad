include <BOSL2/std.scad>
include <BOSL2/beziers.scad>
include <BOSL2/rounding.scad>

$fn   = 100;
wall  = 1.6;  // wall thickness (mm)
show3D = false;   // toggle: true = 3D bell, false = 2D debug

// --- DEFINE CONTROL POINTS ONCE ---
ctrlpts = [
    [(15.5 - wall)/2,   0],    // throat
    [(15.5 - wall)/2,   160],    // gentle expansion
    [30,              180],    // stronger flare
    [(140 - wall)/2,  200]     // rim
];

// --- BUILD CURVES FROM CONTROL POINTS ---
centerline = bezier_curve(ctrlpts, splinesteps=50);
shell      = offset_stroke(centerline, [-wall/2, +wall/2]);


rotate_sweep(shell, 360);

//debug_bezier(ctrlpts);