include <BOSL2/std.scad>
$fn=64;


linear_extrude(2)
minute_hand();


module hour_hand(){
  diff(){
    hull(){
    circle(d=8);
    right(40)circle(d=3);
    } 
    tag("remove")circle(d=4.2);
    tag("remove")square([10,.3], anchor=RIGHT);
  } 
}

module minute_hand(){
  diff(){
    hull(){
    circle(d=4);
    right(60)circle(d=1);
    } 
    tag("remove")circle(d=1.65);
    tag("remove")square([10,.3], anchor=RIGHT);
  } 
}
