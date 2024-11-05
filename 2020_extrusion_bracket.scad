include <NopSCADlib/core.scad>

include <NopSCADlib/vitamins/extrusions.scad>
include <NopSCADlib/vitamins/extrusion_brackets.scad>
include <NopSCADlib/vitamins/washers.scad>
include <NopSCADlib/vitamins/nuts.scad>

let($show_threads = true)
extrusion_inner_corner_bracket(E20_inner_corner_bracket, grub_screws = false);