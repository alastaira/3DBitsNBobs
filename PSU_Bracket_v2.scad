//
// PSU Bracket modifier to add bottom-plate mounting holes,
//		and adjust outside mounting holes.
//

$fn=100;

// These must match original STL (don't change):
OrigBaseThickness = 5;	// Thickness of original base
OrigBaseWidth = 20;		// Width of original base
OrigBaseLength = 160;	// Length of original base
OrigOverallHeight = 60;	// Overall height from bottom of base to top of clips
OrigClipDist = 115;		// Distance between the clips (inside-to-inside)
OrigClipThickness = 7.5;	// Thickness of the clips
OrigOutsideHoleCenters = 145;	// Center-to-center distance for outside screws
OrigOuterTabLength = ((OrigBaseLength-OrigClipDist)/2) - OrigClipThickness;		// Length of tab on the outside of the clip on each side


// Settings:
// ---------

RemoveClips = false;	// Set to 'true' to remove the clips

ExtraThickness = 3;		// Extra base thickness to accommodate screw counter-bore (can't exceed original base thickness minus outside chamfer!)

ExtraClipDist = 1;		// Amount of distance to add between clips

ExtraClipLength = 0;	// Amount of extra length to add on the clips

// Note: 4mm/8mm pair is roughly for a #6 self-tapping screw
OutsideHoleDia = 5;		// Diameter for outside screws (original was 5.5)
OutsideHoleCounterBoreDia = 9;		// Counter-bore hole diameter for outside screws (original was 10.5)
OutsideHoleCounterBoreDepth = 4;	// Counter-bore hole depth for outside screws (original was 2)
OutsideHoleCenters = OrigOutsideHoleCenters+(RemoveClips ? 0 : ExtraClipDist);		// Center-to-center distance for outside screws

NewBaseLength = OrigBaseLength + (RemoveClips ? 0 : ExtraClipDist);
NewBaseThickness = OrigBaseThickness+ExtraThickness;
NewOverallHeight = OrigOverallHeight+ExtraThickness;
NewClipDist = OrigClipDist+ExtraClipDist;

// Note: 4.2mm/7.2mm is for an M4 socket cap-head screw:
BottomHoleDia = 4.2;		// Diameter for bottom hole screws
BottomHoleCounterBoreDia = 7.2;	// Counter-board diameter for bottom hole screws
BottomHoleCounterBoreDepth = BottomHoleDia;	// Counter-bore hole depth for bottom hole screws
BottomHoleCenters = 50;			// Center-to-center distance for bottom hole screws

OffsetWidth = OrigBaseWidth*0.75;	// Width of offset for Offset Bracket version only
OffsetLength = BottomHoleCenters*1.75;	// Length of offset for Offset Bracket version only
OffsetCornerRadius = 6;			// Radius of corners of offset for Offset Bracket version only

TopCornerRadius = 3;		// Radius of the new top corner for the Side-Bracket version only

// Select version to render:
// 0 = Normal Bracket
// 1 = Offset Bracket
// 2 = Normal Side Bracket (RemoveClips must be false!)
// 3 = Offset Side Bracket (RemoveClips must be false!)
RenderType = 0;

OffsetInside = false;	// Set to 'true' to offset other direction (only useful for "side bracket" style since the normal bracket is symmetric)

union() {
	// Bottom Half:
	intersection() {
		translate([-NewBaseLength/2-0.1, -0.1, -0.1])
		cube([NewBaseLength+0.2, NewOverallHeight/2 + ExtraClipLength + 0.2, OrigBaseWidth+0.2]);
		CoreBracket();
	}

	// Top Half:
	translate([0, ExtraClipLength, 0])
	intersection() {
		translate([-NewBaseLength/2-0.1, NewOverallHeight/2-0.1, -0.1])
		cube([NewBaseLength+0.2, NewOverallHeight/2 + 0.2, OrigBaseWidth+0.2]);
		CoreBracket();
	}
}


module CoreBracket()
{
	union() {
		difference() {
			union() {
				NewBaseBracket();

				if ((RenderType == 1) || (RenderType == 3)) {
					translate([0, 0, OffsetInside ? - OffsetWidth - OrigBaseWidth + OffsetCornerRadius/2 : 0])
					hull() {
						translate([-OffsetLength/2+OffsetCornerRadius/2, 0, OrigBaseWidth-OffsetCornerRadius/2])
						rotate([-90, 0, 0])
						cylinder(d=OffsetCornerRadius, h=NewBaseThickness);
						translate([+OffsetLength/2-OffsetCornerRadius/2, 0, OrigBaseWidth-OffsetCornerRadius/2])
						rotate([-90, 0, 0])
						cylinder(d=OffsetCornerRadius, h=NewBaseThickness);
						translate([-OffsetLength/2+OffsetCornerRadius/2, 0, OrigBaseWidth+OffsetWidth-OffsetCornerRadius/2])
						rotate([-90, 0, 0])
						cylinder(d=OffsetCornerRadius, h=NewBaseThickness);
						translate([+OffsetLength/2-OffsetCornerRadius/2, 0, OrigBaseWidth+OffsetWidth-OffsetCornerRadius/2])
						rotate([-90, 0, 0])
						cylinder(d=OffsetCornerRadius, h=NewBaseThickness);
					}
				}

				if ((RenderType == 2) || (RenderType == 3)) {
					// Add a tab to new outside (bottom):
					translate([-NewClipDist/2-OrigClipThickness, 0, 0])
					rotate([0, 0, -90])
					translate([-(NewClipDist/2+OrigClipThickness), 0, 0])
					intersection() {
						NewBaseBracket();
						OuterTabArea(PosX = true, AddInnerOverlap = true);
					}
				}

			}

			// Add Bottom holes:
			translate([-BottomHoleCenters/2, 0, (((RenderType==0)||(RenderType==2)) ? OrigBaseWidth/2 : (OffsetInside ? -OffsetWidth/2 : OrigBaseWidth + OffsetWidth/2))])
			BottomPlateHole();

			translate([BottomHoleCenters/2, 0, (((RenderType==0)||(RenderType==2)) ? OrigBaseWidth/2 : (OffsetInside ? -OffsetWidth/2 : OrigBaseWidth + OffsetWidth/2))])
			BottomPlateHole();

			if ((RenderType == 0) || (RenderType == 1)) {
				// Add new outside holes:
				translate([-OutsideHoleCenters/2, 0, OrigBaseWidth/2])
				OutsideHole();

				translate([OutsideHoleCenters/2, 0, OrigBaseWidth/2])
				OutsideHole();
			} else if ((RenderType == 2) || (RenderType == 3)) {
				// Remove outside tabs entirely:
				OuterTabArea(PosX = true);
				OuterTabArea(PosX = false);

				// Add new "outside" holes on new mounting end:
				translate([-(NewBaseLength-OrigOuterTabLength+ExtraClipDist)/2 + NewBaseThickness, -OrigOuterTabLength/2, OrigBaseWidth/2])
				rotate([0, 0, -90])
				OutsideHole();

				translate([-(NewBaseLength-OrigOuterTabLength+ExtraClipDist)/2 + OrigClipThickness, NewOverallHeight*2/3, OrigBaseWidth/2])
				rotate([0, 0, -90])
				OutsideHole();

				// Radius the new top corner:
				translate([NewClipDist/2 + OrigClipThickness-TopCornerRadius, TopCornerRadius-0.1, -0.1])
				difference() {
					translate([0, -TopCornerRadius, 0])
					cube([TopCornerRadius+0.1, TopCornerRadius+0.1, OrigBaseWidth+0.2]);
					translate([0, 0, -0.1])
					intersection() {
						cylinder(r=TopCornerRadius, h=OrigBaseWidth+0.2);

						translate([-0.1, -TopCornerRadius, 0])
						cube([TopCornerRadius+0.1, TopCornerRadius+0.1, OrigBaseWidth+0.2]);
					}
				}
			}
		}
	}
}

module OuterTabArea(PosX = true, AddInnerOverlap = false) {
	translate([PosX ? (NewClipDist/2+OrigClipThickness) : (-NewClipDist/2-OrigClipThickness-OrigOuterTabLength-0.1) - (AddInnerOverlap ? 0.1 : 0), -0.1, -0.1])
	cube([OrigOuterTabLength+0.1 + (AddInnerOverlap ? 0.1 :0), NewOverallHeight+0.2, OrigBaseWidth+0.2]);
}

module OutsideHole() {
	translate([0, -0.1, 0])
	rotate([-90, 0, 0])
	union() {
		cylinder(d=OutsideHoleDia + 0.2, h=NewBaseThickness + 0.2);	// Bore
		translate([0, 0, NewBaseThickness + 0.1 - OutsideHoleCounterBoreDepth])
		cylinder(d=OutsideHoleCounterBoreDia + 0.1, h=OutsideHoleCounterBoreDepth+0.1);
	}
}

module BottomPlateHole() {
	translate([0, -0.1, 0])
	rotate([-90, 0, 0])
	union() {
		cylinder(d=BottomHoleDia + 0.2, h=NewBaseThickness + 0.2);	// bore
		cylinder(d=BottomHoleCounterBoreDia + 0.1, h=BottomHoleCounterBoreDepth+0.1);	// counter-bore
	}
}

module NewBaseBracket() {
	if (RemoveClips) {
		// Remove the Clips:
		difference() {
			ThickerBaseBracket();

			translate([-OrigBaseLength/2-0.1, NewBaseThickness, -0.1])
			cube([OrigBaseLength+0.2, OrigOverallHeight+0.1-OrigBaseThickness, OrigBaseWidth+0.2]);
		}
	} else {
		// Add the ExtraClipDist to the bracket:
		union() {
			translate([ExtraClipDist/2, 0, 0])
			intersection() {
				ThickerBaseBracket();

				translate([-ExtraClipDist/2-0.1, -0.1, -0.1])
				cube([NewBaseLength/2+0.2, NewOverallHeight+0.2, OrigBaseWidth+0.2]);
			}

			translate([-ExtraClipDist/2, 0, 0])
			intersection() {
				ThickerBaseBracket();

				translate([-OrigBaseLength/2-0.1, -0.1, -0.1])
				cube([NewBaseLength/2+0.2, NewOverallHeight+0.2, OrigBaseWidth+0.2]);

			}
		}
	}
}

module ThickerBaseBracket() {
	// Add the ExtraThickness to the bracket base:
	translate([0, ExtraThickness, 0])
	union() {
		OriginalBracket();

		translate([0, -ExtraThickness, 0])
		intersection() {
			OriginalBracket();
			translate([-OrigBaseLength/2 - 0.1, 0, 0])
			cube([OrigBaseLength + 0.2, ExtraThickness + 0.1, OrigBaseWidth + 0.2]);
		}
	}
}

module OriginalBracket() {
	union() {
		// Align to Y and Z axis:
		translate([0, 20, 115])
		import("orig_PSU_Bracket_no_notch.stl", convexity=3);

		// Fill old outside holes:
		translate([-OrigOutsideHoleCenters/2, 0, OrigBaseWidth/2])
		rotate([-90, 0, 0])
		cylinder(d=10.6, h=OrigBaseThickness);

		translate([OrigOutsideHoleCenters/2, 0, OrigBaseWidth/2])
		rotate([-90, 0, 0])
		cylinder(d=10.6, h=OrigBaseThickness);
	}
}

