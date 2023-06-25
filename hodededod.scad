difference(){
  rotate_extrude(angle = 360, $fn=100)
    polygon(points=[ [0,0], [6,0], [6.2,3.4], [1.7,3.4], [1.7,6], [3.3,6], [3.3,8], [0,8]]      );

  translate([-6,1.7,6])
    cube(size = [12, 2, 2]);  
  translate([-6,-3.7,6])
    cube(size = [12, 2, 2]);  
  
  translate([-4.4,-1.1,0])
    cube(size = [8.8,2.2,2]);  
}

    
