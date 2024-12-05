include <BOSL2/std.scad>
$fn=64;


rect_tube(size=[25,6], isize=[23,4], h=70, anchor=BOTTOM)

attach(TOP){
//xrot(90)down(1.5)
difference() {
    skin(
        [square([25,6],center=true),
         circle($fn=64,d=40)], z=[0,20],
        slices=40,sampling="length",method="reindex");
    skin(
        [square([23,4],center=true),
         circle($fn=64,d=37.2)], z=[-.01,20.01],
        slices=40,sampling="length",method="reindex");
}
}
up(90)
tube(od2=42.6, od1=40, wall=1.4, h=3, anchor=BOTTOM);
up(93)
tube(od2=36, od1=42.6, wall=1.4, h=3, anchor=BOTTOM);
up(90)
diff(){
  tube(od=36, wall=1.4, h=25, anchor=BOTTOM){
  tag("remove")
    rot_copies([0, 90, 180, 270])
      right(17.7)
        zcyl(d=6, h=35);
  tag("keep")
    intersection() {
      zcyl(d=36, h=25);
        rot_copies([0, 90, 180, 270])
          right(17.7)
            tube(od=6, wall=1.4, h=25);
            }
    }
}