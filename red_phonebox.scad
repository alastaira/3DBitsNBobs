include <BOSL2/std.scad>

phonebox_side();

module phonebox_side(){
  color(c=[1,0,0,])
  diff(){
      cuboid([760, 1970, 36], anchor=BOTTOM);
      tag("remove") 
        grid_copies(n=[3,5], spacing=[212,363])
        cuboid([192,343,40], anchor=BOTTOM);  
   }
   grid_copies(n=[3,5], spacing=[212,363])
   pane();     
 }

module phonebox_front(){
  color(c=[255,0,0,])
  diff(){
    cuboid([710, 1970, 36], anchor=BOTTOM);
    tag("remove") 
    grid_copies(n=[3,5], spacing=[212,363])
    cuboid([192,343,40], anchor=BOTTOM);
   }
}


module pane(){
  color(c=[0.8, 0.8, 0.8, 0.8])
  translate([0,0,36/2])cuboid([190, 340, 4]);
}