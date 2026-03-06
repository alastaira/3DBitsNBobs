include <BOSL2/std.scad>
$fn=100;

// RC320 Mini 24mm Round Cylindrical Vibrating Motor DC 5V 6V 7.2V 9V 12V Strong Vibration Eccentric wheel
// https://www.aliexpress.com/item/1005006161233137.html?spm=a2g0o.order_list.order_list_main.51.7813180259UpbB




tube(od=85, id=55, h=1, anchor=BOTTOM);
tube(od=55, id=53, h=30, anchor=BOTTOM);

/*
diff(){
  tube(od=37, id=25, h=2);
  tag("remove")
  zrot_copies(n=3, r=15.3)
  zcyl(d=2.8,h=2);
}
*/