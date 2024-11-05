include <BOSL2/std.scad>
$fn=100;


module 60pixel(){
diff(){
  tube(id=142, od=160, h=2) {
    tag("remove") attach(TOP) tube(id=144, od=158, h=1, anchor=TOP);
    tag("remove") position(BOTTOM) zrot_copies(n=60, r=151/2) cuboid([5.6,5.6,3]);
  }
}
// Diffuser
down(1.4)
tube(id=142, od=160, h=.8);



}

module 40pixel(){
  diff(){
    tube(id=106, od=128, h=2) {
    tag("remove")
    attach(TOP)
    tube(id=108, od=126, h=1, anchor=TOP);
    
     # tag("remove")
      /*position(BOTTOM)*/
    zrot_copies(n=40, r=118.5/2) cuboid([5.6,5.6,3]);
    }
  }
  
  // Diffuser
  down(1.4)
  tube(id=106, od=128, h=.8);
  
}


module 24pixel(){
diff(){
  tube(id=52, od=68.5, h=2) {
  tag("remove")
  attach(TOP)
  tube(id=54, od=66.5, h=1, anchor=TOP);
  
   # tag("remove")
    /*position(BOTTOM)*/
  zrot_copies(n=24, r=60/2) cuboid([5.6,5.6,3]);
  }
}
  // Diffuser
  down(1.4)
  tube(id=52, od=68.5, h=.8);
  

}