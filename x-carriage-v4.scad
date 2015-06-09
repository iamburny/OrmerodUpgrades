// Ormerod X-carriage. This does not include mounting for the z-probe, because I use my hot-end sensor board instead.
// By David Crocker (based original RepRapPro design), https://github.com/dc42/OrmerodSensorBoard
// Modified by John Stäck
// Licensed under GNU General Public License version 2

overlap=1;			// used when adding/subtracting parts to avoid problems
lots=60;				// used for subtracting parts that need to extend beyond everything else
radius=10.65;			// redius to fit linear bearing
mxlPitch=2.032;		// tooth pitch of MXL belt
toothSize=1.2;		// side of cube we use for making teeth to grip the MXL belt
toothOffset=4.1;		// y-offset of teeth
n_teeth = 5;		// Number of teeth for belt grip. Up to 11 fits.
nutTrapWidth=5.8;	// M3 nut is 5.4mm across flats, 6.1mm across widest point.
						// Setting nut trap width to 5.6mm, we actually got 5.3mm.
nutTrapDepth=3.0;	// M3 nut is 2.3mm thick. Allow at least 0.4mm extra.
slotXstart=29;
slotZ=4.3;
slotWidth=3;



 //How far from the right-hand edge (bottom when printing) to the groove. This value makes the bearing protrude about half a millimeter
groove_offset = 4.35;

//Width of the groove. Matches the bearing, but is circular instead of square for printability
groove_width = 1.3;

 //The total width ("height" in this orientation) of the carriage. This value makes the edge line up with the other groove in the bearing, so
//a circlip or something can be installed there. That will only prevent it from moving in one direction though.
total_width = groove_offset + 44.2;



difference () {
	union() {
		difference() {
			// Main body
			translate([-7,0,0]) cube([52,31,total_width]);

			//heatsink screw holes
			translate([-7-overlap,5,5]) rotate([0,90,0]) cylinder(r=1.4,h=20, $fn=18);
			translate([-7-overlap,5,37]) rotate([0,90,0]) cylinder(r=1.4,h=20, $fn=18);

			//bowden slot
			hull() {
				translate([-3.25,30,21]) rotate([90,0,0]) cylinder(r=3.25,h=30, $fn=18);
				translate([-13.25,30,21]) rotate([90,0,0]) cylinder(r=3.25,h=30, $fn=18);
			}

			// Hole for linear bearing
			translate([4.4+radius,9.3+radius,-overlap]) cylinder(r=radius,h=60,$fn=100);

			//Groove for linear bearing
			translate([4.4+radius,9.3+radius,groove_offset])
				rotate_extrude(convexity=4, $fn=72) translate([radius,0,0]) circle(r=groove_width/2, $fn=18);
			
			//Small hole for set screw. This diameter is for an M2 screw, adjust as necessary.
			translate([25-overlap,9.3+radius,groove_offset]) rotate([0,90,0]) cylinder(r=1.6,h=20, $fn=18);

			//Cut stuff underneath (this shaves some off the back part
			translate([-overlap,26.2,-overlap]) cube([24,20,37+overlap]);

			//cut more stuff underneath (remove "sensor holder" part)
			translate([-overlap-7,26.2,-overlap]) cube([14.4+radius,20,lots]);

			//Cut stuff under bearing holder
			translate([-overlap,28,-overlap]) cube([lots,20,37+overlap]);

			//Cut stuff off the back and left side
			translate([11,19,9]) cube([lots,20,60]);

			//Other stuff off the back (cut off angled edge)
			translate([26.5,-overlap,9]) cube([lots,30,80]);

			//This is on top of the screw hole for the bearing. However, it is outside of what is already "cut off", so it seemingly does nothing
			translate([23,-overlap,9]) cube([lots,6.3+overlap,lots]);

			//Top of old sensor holder
			*translate([-overlap,-overlap,48]) cube([lots,10+overlap+lots,lots]);

			//Back of old sensor holder segment
			*translate([9.5,-overlap,48]) cube([lots,25,lots]);
			
			//Angled part under old sensor holder
			*translate([-overlap,26.2,37]) rotate([-45,0,0]) cube([lots,lots,lots]);

			//Top of bearing holder thing
			translate([19.7+overlap,-overlap,-overlap]) cube([lots,5.8+overlap,20]);
			// Belt slot
			translate([12.5,4.25,-overlap]) cube([10,1.4,lots]);
			translate([12.5,3.6,-overlap]) cube([10,1,22+overlap]);
			translate([12.5,3.6,22]) rotate([-45,0,0]) cube([10,1,1]);

			// Slot for x-runner nut
			translate([slotXstart-2.3,11,slotZ-(nutTrapWidth/2)])
				cube([slotWidth+2.3+3,3.3,20]);
			// Slot for x-runner screw
			translate([slotXstart,0,slotZ-1.6]) cube([slotWidth,13,3.2]);
			translate([slotXstart,0,slotZ]) rotate([-90,0,0]) cylinder(r=1.6,h=13,$fn=12);
			translate([slotXstart+slotWidth,0,slotZ])
				rotate([-90,0,0]) cylinder(r=1.6,h=13,$fn=12);

			// Shave off bottom corner
			translate([43,0,-overlap]) rotate([0,0,20]) cube([lots,lots,lots]);
			translate([38,0,-overlap]) cube([lots,lots,lots]);

			translate([21,0,9]) rotate([0,0,-30]) cube([lots,25,lots]);

		}

		// Teeth to grip belt
		difference() {
			union () {
				translate([12.5-overlap,toothOffset,25]) {
					for(tooth=[0:n_teeth-1]) {
						translate([0,0,tooth*mxlPitch]) rotate([45,0,0]) cube([10,toothSize,toothSize]);
					}
				}
			}
			// Blunt the teeth to allow sufficient belt clearance
			translate([12.5,toothOffset+0.6,-overlap]) cube([10,0.5,lots]);
		}
	}
	translate([19.5,-overlap,-overlap]) cube([6.1,6.3+overlap,lots]);
}

//Draw a LM12LUU bearing for reference
*translate([4.4+radius,9.3+radius,-0.5]) difference()
{
	color([0.9,0.9,0.9]) cylinder(r=10.5,h=57,$fn=100);
	translate([0,0,4.2]) rotate_extrude(convexity=4) translate([10.5-1.3/2,0,0]) square(1.3);
	translate([0,0,51.5]) rotate_extrude(convexity=4) translate([10.5-1.3/2,0,0]) square(1.3);

}

module hsmount() {
	translate([-6.9,0,0]) cube([7,27,40]);
}

