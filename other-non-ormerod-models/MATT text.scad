$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

h = 5;
fontsize = 20;

translate([0,0,0]) linear_extrude(height=h) 
	text("M", font = "Racing Sans One", size = fontsize, halign = "center");

translate([17,0,0]) linear_extrude(height=h) 
	text("A", font = "Racing Sans One", size = fontsize, halign = "center");

translate([28,0,0]) linear_extrude(height=h) 
	text("T", font = "Racing Sans One", size = fontsize, halign = "center");

translate([39,0,0]) linear_extrude(height=h) 
	text("T", font = "Racing Sans One", size = fontsize, halign = "center");