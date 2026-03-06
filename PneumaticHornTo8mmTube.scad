include <BOSL2/std.scad>
include <BOSL2/beziers.scad>
include <BOSL2/rounding.scad>
$fn   = 100;
tube(id=15.8, wall=1.6, h=16)
attach(TOP) tube(id1=15.8, od2=5.2, id2=3.2, wall=1.6, h=10, anchor=BOTTOM)
attach(TOP) tube(od=5.2, id=3.2, h=10, anchor=BOTTOM);