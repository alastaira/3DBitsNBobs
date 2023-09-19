
// Holder
$fn=50;
translate([0,0,10])
cylinder(d=6, h=15);
difference(){
cylinder(d=27.4, h=10);
  cylinder(d1=23.5, d2=23.3, h=8);
}

/*
// Centre finder
$fn=50;
difference(){
  cylinder(d=25.4, h=3);
  translate([0,0,1])
  cylinder(d1=23.5, d2=23.2, h=2);
  cylinder(d1=3, d2=1, h=1);
}
*/