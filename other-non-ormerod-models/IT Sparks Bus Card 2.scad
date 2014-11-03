$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

difference() {
	union() {
		translate([0,-5,0]) cube([85,38,1],true);
		translate([0,-5,2]) cube([83,36,2],true);
	}	

	union() {
		translate([0,0,1]) linear_extrude(height=7) 
			text("IT Sparks", font = "Racing Sans One", size = 10, halign = "center");

		translate([0,-10,1]) 
			linear_extrude(height=7) 
			text("matt@itsparks.co.uk", font = "Open Sans", size = 6, halign = "center");

		translate([0,-20,1])
			 linear_extrude(height=7) 
			 text("01235 510565", font = "Open Sans:style=Semibold Italic", size = 6, halign = "center");
	}
}