include <BOSL2/std.scad>

xcopies(spacing=2.54, l=7*2.54) 
linear_extrude(7)
shell2d(-0.5) {square([2.54,2.54], center=true);}