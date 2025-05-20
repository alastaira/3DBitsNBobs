//
// NopSCADlib Copyright Chris Palmer 2018
// nop.head@gmail.com
// hydraraptor.blogspot.com
//
// This file is part of NopSCADlib.
//
// NopSCADlib is free software: you can redistribute it and/or modify it under the terms of the
// GNU General Public License as published by the Free Software Foundation, either version 3 of
// the License, or (at your option) any later version.
//
// NopSCADlib is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
// without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along with NopSCADlib.
// If not, see <https://www.gnu.org/licenses/>.
//
include <NOPScadlib/core.scad>

height = 15;
width = 22;
flange_height = 3.5;
flange_offset = 0;
num_holes = 4;
hole_diam = 3.5;
hole_offset = 8;

include <NOPScadlib/vitamins/leadnuts.scad>
LSN8x2  = ["LSN8x2",  "Leadscrew nut 8 x 2", 8, 10.2, height, width, flange_height, flange_offset, num_holes, hole_diam, hole_offset, M3_cap_screw, 2, 4, 0, "dimgrey"];

let($show_threads = true)

leadnut(LSN8x2);

/*
module leadnuts()
    layout([for(n = leadnuts) leadnut_flange_dia(n)], 5)
        leadnut(leadnuts[$i]);

if($preview)
    let($show_threads = true) {
        leadnuts();
    }
*/