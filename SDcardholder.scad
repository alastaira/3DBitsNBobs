// Variables
fullSize = [58, 30, 15];
sdSize = [3, 28, 14];
usbSize = [6, 14, 14];
msdSize = [2, 12, 10];

// Main cube 
difference() {
    cube(fullSize);

    // The big SD cards
  for(i = [0:9])
    translate([i+1+sdSize[0]*i, 1, 1]) cube(sdSize);

    c = 12+sdSize[0]*10;

  for(i = [0:4]) {
    translate([c+i+1+msdSize[0]*i, 1, 5]) cube(msdSize);
    translate([c+i+1+msdSize[0]*i, msdSize[1]+5, 5]) cube(msdSize);
  }

}