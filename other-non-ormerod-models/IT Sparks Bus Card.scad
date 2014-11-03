

difference() {
union() {
	translate([0,-15,0]) cube([275,120,1],true);
	translate([0,-15,2]) cube([265,110,2],true);
}
union() {
translate([0,0,1]) linear_extrude(height=7) 
 text("IT Sparks", font = "Racing Sans One", size = 40, halign = "center");

translate([0,-30,1]) 
 linear_extrude(height=7) 
 text("matt@itsparks.co.uk", font = "Open Sans", size = 20, halign = "center");

translate([0,-60,1])
 linear_extrude(height=7) 
 text("01235 510565", font = "Open Sans:style=Semibold Italic", size = 20, halign = "center");
}
	
}