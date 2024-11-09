include <BOSL2/std.scad>
$fn=64;


rect_tube(size=[25,6], isize=[23,4], h=40, anchor=BOTTOM)

attach(TOP){
//xrot(90)down(1.5)
difference() {
    skin(
        [square([25,6],center=true),
         circle($fn=64,d=33.6)], z=[0,20],
        slices=40,sampling="length",method="reindex");
    skin(
        [square([23,4],center=true),
         circle($fn=64,d=30.8)], z=[-.01,20.01],
        slices=40,sampling="length",method="reindex");
}
}
up(60)
tube(od2=37.6, od1=31, wall=1, h=2, anchor=BOTTOM);
up(62)
tube(od2=31, od1=37.6, wall=1, h=2, anchor=BOTTOM);
up(60)
tube(od=33.6, wall=1.4, h=25, anchor=BOTTOM);