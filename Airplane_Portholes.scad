include <BOSL2/std.scad>
$fn=100;
// https://www.theflightclub.it/en/2023/12/when-you-fly-you-like-the-view-plane-by-plane-window-size-ranking/

Boeing787 = [272, 467];
Boeing777 = [254, 381];
AirbusA220 = [280, 406];
AirbusA320 = [229, 312];

Monitors = [[540,310], [530,305], [515, 290]];
// MOnitor(54x31, 53x30.5, 51.5x29)
// 747 27.2cm base by 46.7 height

difference(){
  rotate(90)rect(Monitors[0]);
  rect(AirbusA220, rounding=100);
}

xdistribute(spacing=500){
/*
  rect(AirbusA220, rounding=10);
  rect(AirbusA320, rounding=10);
  rect(Boeing787, rounding=10);
  rect(Boeing777, rounding=12);
  */
  difference(){
  rotate(90)rect(Monitors[0]);
  rect(AirbusA220, rounding=100);
  }
  difference(){
  rotate(90)rect(Monitors[1]);
  rect(AirbusA220, rounding=100);
}
difference(){
  rotate(90)rect(Monitors[2]);
  rect(AirbusA220, rounding=100);  
  }
}
