include <BOSL2/std.scad>
$fn=64;


rect_tube(size=[25,6], isize=[23,4], h=40, anchor=BOTTOM)

attach(TOP){
//xrot(90)down(1.5)
difference() {
    skin(
        [square([25,6],center=true),
         circle($fn=64,d=31)], z=[0,20],
        slices=40,sampling="length",method="reindex");
    skin(
        [square([23,4],center=true),
         circle($fn=64,d=29)], z=[-.01,20.01],
        slices=40,sampling="length",method="reindex");
}
}
up(60)
tube(od2=33, od1=31, wall=1, h=1, anchor=BOTTOM);
up(61)
tube(od2=31, od1=33, wall=1, h=1, anchor=BOTTOM);
up(60)
tube(od=31, wall=1.4, h=25, anchor=BOTTOM);