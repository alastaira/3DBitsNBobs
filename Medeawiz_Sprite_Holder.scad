difference(){
cube([5,65.5,18]);
  translate([0,1,1])
    cube([5,63.5,16,]);
}


difference(){
  cube([15,10,1]);
  translate([10,5,0])
  cylinder(d=3.5, $fn=100);
}
translate([0,65.5-10,0])
difference(){
  cube([15,10,1]);
  translate([10,5,0])
  cylinder(d=3.5, $fn=100);
}