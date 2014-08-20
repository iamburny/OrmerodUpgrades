
linear_extrude(height=5) text("IT Sparks", font = "Racing Sans One", size = 40, halign = "center");

translate([0,-30,0]) linear_extrude(height=4) text("matt@itsparks.co.uk", font = "Open Sans", size = 20, halign = "center");

translate([0,-60,0]) linear_extrude(height=4) text("01235 510565", font = "Open Sans:style=Semibold Italic", size = 20, halign = "center");

difference() {
	translate([0,-15,0]) cube([275,120,5],true);
	translate([0,-15,2]) cube([265,110,5],true);
}