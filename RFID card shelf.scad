include <BOSL2/std.scad>



path = [[0,10], [0,0], [90.5,0], [90.5,10]];
linear_extrude(1)
stroke(path, width=4, $fn=64);



/*
difference(){
  cuboid([88,56,1], rounding=1,edges=["Z"]);
  tag("remove") RFIDcard();
}

module RFIDcard(){
  cuboid([86,54,1], rounding=1,edges=["Z"]);
}
*/