include <BOSL2/std.scad>
$fn=100;

linear_extrude(1.4){

  difference(){
  
    rect([50,50], rounding=2);
    circle(d=44);
    grid_copies(spacing=42, n=[2,2])
  circle(d=3);
  }

    intersection(){
    circle(d=45);
grid_copies(spacing=5*cos(180/6), stagger="alt", n=[22,13])
  zrot(180/6)
    difference(){
      circle(d=5, $fn=6);
      circle(d=4, $fn=6);
      }
     
     
     }
     
       }
  