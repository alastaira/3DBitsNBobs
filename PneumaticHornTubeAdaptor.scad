include <BOSL2/std.scad>
$fn=100;

tube(od=10.5, id=8.3, h=12, anchor=BOTTOM)
attach(TOP) tube(od1=10.5, id1=8.3, od2=5.3, id2=3.2, h=5, anchor=BOTTOM)
attach(TOP) tube(od=5.3, id=3.2, h=10, anchor=BOTTOM);

up(17) scale([1,1,2]) torus(d_maj=5.3, d_min=.8);
up(20) scale([1,1,2]) torus(d_maj=5.3, d_min=.8);
up(23) scale([1,1,2]) torus(d_maj=5.3, d_min=.8);