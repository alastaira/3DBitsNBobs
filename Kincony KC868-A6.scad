include <BOSL2/std.scad>
$fn=64;

//cover_plate2();

cover_spacer();

/*
difference(){
  linear_extrude(3)
  rect([150,108.4], rounding=3);

 // tag("remove")
  up(.5)
  linear_extrude(2.6)
    KC868_A6();
    
  grid_copies(n=[4,5], spacing=[30, 20])
    cuboid([20,10,4]);
    
}
*/

module cover_spacer(){

  tube(id=3.5, od=6.5, h=24);

}


module KC868_A6(){
  diff(){
    // Exterior
    rect([130+9+9, 106.4])
    // Corner cutouts
    tag("remove") position([BOTTOM+LEFT, BOTTOM+RIGHT, TOP+LEFT, TOP+RIGHT])
    rect([9*2,24.7*2], rounding=3);
    // Screw holes
    grid_copies(n=2, spacing=[125.18, 97.01])
    tag("remove") circle(d=3.5);
  }
}


module cover_plate(){
  diff(){
  

    rect([150,108.4], rounding=3);
  
  
    tag("remove")
    // Screw holes
    grid_copies(n=2, spacing=[125.18, 97.01])
    tag("remove") circle(d=3.5);
  }
}

module cover_plate2(){
  diff(){
  

    rect([154,83], rounding=3);
  
  
    tag("remove")
    // Screw holes
    grid_copies(n=2, spacing=[144, 73])
    tag("remove") circle(d=3.5);
  }
}
