$fn=90;

// Cylinder measures
h_cylinder = 17;
d_internal = 15.5;    // <---- DIAMETER LENS
d_external = 23;

// Cone measures
h_cone = 10;        // <---- HEIGHT LENS
d_hole = 3;       // <---- LASER HOLE
hole_wall = 3;
hole_tube = 4;

// Glass measures
h_glas = 26;
w_glass = 37.6;
t_glass = 2.5;     // <---- GLASS THICKNESS
glass_distance = 17.5;  // <---- GLASS TO LASER DISTANCE
rounded_border = 2;

// Tube hole
hole_size = 25;
hole_diameter = 6; // <---- TUBE HOLE DIAMETER
hole_disps = 5;


// Joint
joint_rounded_border = 2.5;
w_joint = 10 + 2 * joint_rounded_border;
d_joint = glass_distance - d_external  / 2 + t_glass;
t_joint = d_internal / 2 + 1.2;
c_joint = 3;

// Screws support
w_screws = 7.5;
l_screws = 9 + w_screws / 2;
h_screws = 2;
d_screws_hole = 3.5;
h_joined = 10;

module screws() {
    translate([0,(d_external + d_internal)/4,0])
    union() {
        difference() {
            union() {
                translate([-w_screws / 2, 0, 0])
                cube([w_screws, l_screws, h_screws]);
                
                translate([0,l_screws,0])
                cylinder(h_screws, w_screws / 2, w_screws / 2);
            }
            
            translate([0,l_screws,0])
            cylinder(h_screws, d_screws_hole/2, d_screws_hole/2);
            
            translate([-w_screws/2,l_screws-1,0])
            rotate([0,0,45])
            cube([w_screws, w_screws, h_screws]);
            
            translate([w_screws/2,l_screws-1,0])
            rotate([0,0,45])
            cube([w_screws, w_screws, h_screws]);
                
            translate([-w_screws/2,l_screws + 1 ,0])
            cube([w_screws, w_screws, h_screws]);
        }
        
        rotate([0, -90, 0])
        linear_extrude(height = w_screws, center=true, convexity = 10, twist = 0)
        polygon(points=[[0,0],[h_joined,0],[0,h_joined]], paths=[[0,1,2]]);
    }
}

module rcube(size, radius) {
    hull() {
        translate([radius, radius]) cylinder(r = radius, h = size[2]);
        translate([size[0] - radius, radius]) cylinder(r = radius, h = size[2]);
        translate([size[0] - radius, size[1] - radius]) cylinder(r = radius, h = size[2]);
        translate([radius, size[1] - radius]) cylinder(r = radius, h = size[2]);
    }
}

module hole_rounder()
{
  radius = 2;
  displacement = d_hole / 2 + radius;
    
  rotate([180,0,0])
  intersection() {
    difference() {
    translate([0,0,-3])
    cube([6,6,6],center=true);
        
    rotate_extrude(convexity = 10)
    translate([displacement, 0, 0])
    circle(r = radius);
    }

    translate([0,0,-7])
    cylinder(8, 3, 3);
  }
}

module nozzle() {
    difference() {
        cylinder(h_cylinder, d_external/2, d_external/2);
        translate([0,0,-1])
        cylinder(h_cylinder+2, d_internal/2, d_internal/2);
    }

    translate([0,0,h_cylinder])
    difference()
    {
        cylinder(h_cone, d_external/2, d_hole / 2 + hole_wall);
        cylinder(h_cone - hole_tube, d_internal/2);
        cylinder(h_cone, d_hole/2, d_hole/2);
        
        translate([0,0,h_cone-1.5])
        hole_rounder();
    }
    
    
}

module glass() {
    translate([-w_glass/2, glass_distance + t_glass, 0])
    rotate([90,0,0])
    rcube([w_glass, h_glas, t_glass], rounded_border);
}

module hole() {
    translate([0,glass_distance + 2 * t_glass,hole_disps])
    rotate([60,0,0])
    cylinder(hole_size, hole_diameter/2, hole_diameter/2);
}



module joint() {
    h_joint = h_cone + h_cylinder;
    
    difference(){
        
        translate([-w_joint/2, t_joint +0.5, 0])
        intersection()
        {
            difference() {
                cube([w_joint,d_joint, h_joint]);
                
                translate([w_joint ,joint_rounded_border,0])
                cylinder(h_joint, joint_rounded_border, joint_rounded_border);
                
                translate([w_joint - joint_rounded_border, joint_rounded_border, 0])
                cube([joint_rounded_border, d_joint - 2 * joint_rounded_border, h_joint]);
                
                translate([w_joint, d_joint - joint_rounded_border,0])
                cylinder(h_joint, joint_rounded_border, joint_rounded_border);
                
                translate([0, joint_rounded_border, 0])
                cylinder(h_joint, joint_rounded_border, joint_rounded_border);
                
                translate([0, joint_rounded_border, 0])
                cube([joint_rounded_border, d_joint - 2 * joint_rounded_border, h_joint]);
                
                translate([0, d_joint - joint_rounded_border,0])
                cylinder(h_joint, joint_rounded_border, joint_rounded_border);
                
                
            }
            
            translate([c_joint / 2,0,0])
            cube([w_joint - c_joint, d_joint, h_joint]);
        }
        
              translate([0, d_joint , h_cylinder + h_cone])
          rotate([0, 90, 0])
            linear_extrude(height = w_joint, center=true, convexity = 10, twist = 0)
            polygon(points=[[0,0],[h_cone + 2,0],[0,d_joint + 2]], paths=[[0,1,2]]);
    }
}

// MAKE THE OBJECT
//-----------------

difference()
{
    union() {
        nozzle();
        glass();
        joint();
    }
    
    hole();
}


rotate([0,0,135]) screws();

rotate([0,0,225]) screws();

      

  