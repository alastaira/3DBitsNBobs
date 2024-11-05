part="rail"; // [diffusor,rail,demo]

height=100; // [0:1000]
hollow="no"; // [yes,no]
rail_wall=0.8; // [0:0.05:10]

strip_width=10.0; // [0:0.1:50]
strip_clearence=0.2; // [0:0.05:2]
strip_border_height=2.0; // [0:0.05:10]
strip_border_width=1.2; // [0:0.05:10]
strip_hook_width=0.7; // [0:0.05:10]
strip_thickness=0.8; // [0:0.05:10]

profile_slot_width=6.2; // [0:0.1:50]
profile_thickness=2.0; // [0:0.1:50]
profile_tooth_edge=0.7; // [0:0.1:50]
profile_tooth_depth=2.0; // [0:0.1:50]
profile_slot_pressure=0.3; // [0:0.1:50]
profile_clearence=0.2; // [0:0.05:2]
profile_edge_min_width=2.0; // [0:0.1:50]

enable_diffusor="yes"; // [yes,no]
diffusor_wall=0.8; // [0:0.05:100]
diffusor_slot_depth=1.0; // [0:0.05:10]
diffusor_holder_wall=1.2; // [0:0.05:10]
diffusor_pressure=0.3; // [0:0.05:10]
diffusor_clearence=0.1; // [0:0.05:10]

angle=30; // [0:360]
offset_x=0.0; // [0:100]
offset_y=0.0; // [0:100]

$fn=32;

//!profile_teeth_shape();
module profile_teeth_shape() {
    r1=1;

    x1=(profile_slot_width+profile_slot_pressure)/2;
    y2=profile_thickness+profile_clearence;
    x3=x1+profile_tooth_edge;
    y4=y2+profile_tooth_depth;
    x5=x1/3;
    y6=y2-2;

    intersection()
    {
        polygon([
            [-x1,0.001],
            [-x1,-y2],
            [-x3,-y2],
            [-x1,-y4],
            [-x5,-y4],
            [-x5,-y6],
    
            [x5,-y6],
            [x5,-y4],
            [x1,-y4],
            [x3,-y2],
            [x1,-y2],
            [x1,0.001]
        ]);
/*
        offset(r1)
            offset(-r1)
                polygon([
                    [-x3-r1,0.001+r1],
                    [-x3-r1,-y4+r1],
                    [-x3,-y2],
                    [-x4,-y4],
                    [-x5,-y4],
                    [-0.5,-y6],
            
                    [0.5,-y6],
                    [x5,-y4],
                    [x4,-y4],
                    [x3,-y2],
                    [x3+r1,-y4+r1],
                    [x3+r1,0.001+r1],
                ]);
*/
    }
}

rail_width=strip_width+2*strip_clearence+2*strip_border_width;
rail_base_width=max(rail_width*cos(angle),profile_slot_width+profile_slot_pressure+2*profile_edge_min_width);

module strip_holder_shape() {
    x1=rail_width/2-strip_border_width;
    y2=strip_thickness;
    x3=x1-strip_hook_width;
    y4=strip_border_height;
    x5=rail_width/2;

    polygon([
        [-x1,0.001],
        [-x1,y2],
        [-x3,y2],
        [-x3,y4],
        [-x5,y4],
        [-x5,-0.001],

        [x5,-0.001],
        [x5,y4],
        [x3,y4],
        [x3,y2],
        [x1,y2],
        [x1,0.001],
    ]);
}

diffusor_holder_height=2*diffusor_holder_wall+diffusor_wall+2*diffusor_clearence;
module diffusor_holder_shape() {
    x1=rail_width/2;
    y2=diffusor_holder_wall;
    x3=x1-diffusor_slot_depth;
    y4=diffusor_holder_height-diffusor_holder_wall;
    y6=diffusor_holder_height;

    polygon([
        [x1,-0.001],
        [x1,y2],
        [x3,y2],
        [x3,y4],
        [x1,y4],
        [x1,y6+0.001],

        [-x1,y6+0.001],
        [-x1,y4],
        [-x3,y4],
        [-x3,y2],
        [-x1,y2],
        [-x1,-0.001]
    ]);
}

diffusor_placeholder_height=2*rail_wall;
module diffusor_placeholder_shape() {
    x1=rail_width/2;
    y6=diffusor_placeholder_height;

    polygon([
        [x1,-0.001],
        [x1,y6+0.001],

        [-x1,y6+0.001],
        [-x1,-0.001]
    ]);
}

module rail_base_shape() {
    x1=rail_width/2;
    x2=rail_base_width-x1;
    x4=rail_width*cos(angle)-x1;
    y4=rail_width*sin(angle);

    polygon([
        [-x1+offset_x-0.001,offset_y+0.001],
        [-x1,-0.001],
        [x2,-0.001],
        [x2,min(offset_y,1)],
        [x4+offset_x-0.001,y4+offset_y+0.001]
    ]);
}

module rail_shape() {
    translate([rail_width/2-rail_base_width/2,0]) {
        translate([-rail_width/2+offset_x,offset_y]) {
            rotate(angle) {
                translate([rail_width/2,0]) {
                    if (enable_diffusor == "yes") {
                        translate([0,diffusor_holder_height])
                            strip_holder_shape();
                        diffusor_holder_shape();
                    } else {
                        translate([0,diffusor_placeholder_height])
                            strip_holder_shape();
                        diffusor_placeholder_shape();
                    }
                }
            }
        }
        
        rail_base_shape();
    }
    
    profile_teeth_shape();
}

module diffusor_inner_shape() {
    x1=rail_width/2;
    y1=diffusor_holder_height-diffusor_holder_wall-diffusor_clearence;
    y2=diffusor_holder_height+strip_border_height+0.5;

    translate([0,y2]) {
        intersection() {
            scale([1,0.3]) circle(r=x1);
            translate([-x1,0])
                square([2*x1,x1]);
        }
    }
    translate([-x1,y1])
        square([2*x1,y2-y1+0.001]);
}

module diffusor_shape() {
    difference()  {
        offset(diffusor_wall)
            diffusor_inner_shape();

        diffusor_inner_shape();
        translate([-(rail_width/2-diffusor_slot_depth-diffusor_pressure),diffusor_holder_wall+diffusor_clearence-0.001])
            square([rail_width-2*diffusor_slot_depth-2*diffusor_pressure,diffusor_wall+0.002]);
    }
}

module diffusor() {
    if (height>0)
        linear_extrude(height=height)
            diffusor_shape();
    else
        diffusor_shape();
}

module rail() {
    if (height>0) {
        linear_extrude(height=height) {
            difference() {
                rail_shape();
                if (hollow=="yes")
                    offset(-rail_wall)
                        rail_shape();
            }
        }
    } else {
        difference() {
            rail_shape();
            if (hollow=="yes")
                offset(-rail_wall)
                    rail_shape();
        }
    }
}

module demo() {
    color("gray")
        rail();
    color("white",0.4) {
        translate([rail_width/2-rail_base_width/2+offset_x,offset_y]) {
            translate([-rail_width/2,0]) {
                rotate(angle) {
                    translate([rail_width/2,0]) {
                        diffusor();
                    }
                }
            }
        }
    }
}

if (part=="diffusor")
    diffusor();
else if (part=="rail")
    rail();
else if (part=="demo")
    demo();
