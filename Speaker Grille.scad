include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=64;

//linear_extrude(1)
//speaker_grille();
standoff();

module speaker_grille(){
diff(){
  rect([128,80], rounding=28);
  tag("remove") grid_copies(spacing=6, n=[36,10], stagger=true) zrot(180/6)circle(d=6, $fn=6);
  tag("remove") grid_copies(n=2,spacing=[90,65]) circle(d=5.2);
  }
}


module standoff(){
  tube(od=8, id=5.1, h=35);
}
