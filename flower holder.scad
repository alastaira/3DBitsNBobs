include <BOSL2/std.scad>

epsilon = 0.01;
thickness = 2;
rand_seed = 54;
$fn=50;
// Disc
cylinder(d=40, h=thickness);

// Coupling to linear shaft
translate([0,0,-5])
difference(){
cylinder(d=20+thickness*2, h = 5);
translate([0,0,-epsilon])
cylinder(d=20.3,  h = 5+epsilon);
}

//poly = [[-25,-25], [25,25], [-25,25], [25,-25]];
poly = make_region(circle(d=36));

grid_copies(spacing=13, stagger=true, inside=poly)
   cylinder(d2=2, d1=3, h=10);;
//%polygon(poly);


/*
width = 40;
height = 40;
num_stalks = 20;
x_positions = rands(-width/2, width/2, num_stalks, rand_seed);
y_positions = rands(-height/2, height/2, num_stalks, rand_seed+1);


 for(i=[0:num_stalks-1]){
        translate([x_positions[i], y_positions[i], 0])
        cylinder(d2=2, d1=2.5, h=10);
      }

*/