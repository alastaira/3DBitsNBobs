include <BOSL2/std.scad>
epsilon = 0.01;

height = 15.6; // 15.6

diff(){
  cuboid([40, 72, height]){
  align(FRONT+BOTTOM) tag("remove") rotate([90,0,0])#prismoid(size2=[18,height], size1=[28,height], h=8);
  align(BACK+BOTTOM) tag("remove") rotate([-90,0,0])#prismoid(size2=[18,height], size1=[28,height], h=8);
    
    
    
  tag("remove") cuboid([40+epsilon,23+epsilon,height+epsilon]);
  
  
  tag("remove") cuboid([28+epsilon,57+epsilon,height+epsilon]);
  
  }
}

move([0,0,-15.6/2])
diff(){
  cuboid([40,72, 3], anchor=TOP);
  tag("remove") ycopies(20) countersunkhole();
  
}

module countersunkhole(){
  zcyl(d1=3, d2=5.5, h=2, anchor=TOP, $fn=32)
  zcyl(d=3, h=4, anchor=TOP, $fn=32);
}