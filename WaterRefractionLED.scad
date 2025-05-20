include <BOSL2/std.scad>

heights = rands(.8, 1.0, 360);
echo (heights);
// https://github.com/BelfrySCAD/BOSL2/wiki/shapes3d.scad#functionmodule-heightfield
intersection() {
    heightfield(size=[100,100], data=[
        for (y=[0:5:360]) [
            for(x=[0:5:360])
            3+ 2*cos(5*x)*sin(5*y)
        ]
    ]);
    cylinder(h=50,d=50);
}
