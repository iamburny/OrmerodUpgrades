$fn=200;
include <gear.scad>; 
include <MCAD/regular_shapes.scad>;

//10.95 = radius;

dia = 21.9;
gap = 10;

teeth=13;
circles=0;

twist=200;
height=12;
pressure_angle=30;
pitch =dia / (teeth /180);

module Lgear() {

//Left gear - Bearing and hex nut trap
gear (number_of_teeth=teeth,
	circular_pitch=pitch,
	pressure_angle=pressure_angle,
	clearance = 0.2,
	gear_thickness = height/2*0.5,
	rim_thickness = height/2,
	rim_width = 5.1,
	hub_thickness = height,
	hub_diameter=15,
	bore_diameter=6.5,
	circles=circles,
	twist=twist/teeth,
	circle_facets=3,
	involute_facets=6);
	
mirror([0,0,1])
gear (number_of_teeth=teeth,
	circular_pitch=pitch,
	pressure_angle=pressure_angle,
	clearance = 0.2,
	gear_thickness = height/2,
	rim_thickness = height/2,
	rim_width = 2,
	hub_thickness = height/2,
	hub_diameter=9,
	bore_diameter=6,
	circles=circles,
	twist=twist/teeth,
	circle_facets=3,
	involute_facets=6);
}

module Rgear() {
//Right Gear	 - Stepper Gear
mirror ([0,1,0])
translate ([dia+gap,0,0])
gear (number_of_teeth=teeth,
	circular_pitch=pitch,
	pressure_angle=pressure_angle,
	clearance = 0.2,
	gear_thickness = height/2*0.5,
	rim_thickness = height/2,
	rim_width = 2,
	hub_thickness = height/2,
	hub_diameter=15,
	bore_diameter=5.2,
	circles=circles,
	twist=twist/teeth,
	circle_facets=3,
	involute_facets=6);

mirror ([0,1,0])
translate ([dia+gap,0,0])	
mirror([0,0,1])
gear (number_of_teeth=teeth,
	circular_pitch=pitch,
	pressure_angle=pressure_angle,
	clearance = 0.2,
	gear_thickness = height/2,
	rim_thickness = height/2,
	rim_width = 2,
	hub_thickness = height/2,
	hub_diameter=9,
	bore_diameter=5.2,
	circles=circles,
	twist=twist/teeth,
	circle_facets=3,
	involute_facets=6);
}

difference() {
	Lgear();
	translate([0,0, height-4]) cylinder(5.1,5.1,5.3); //bearing hole
	translate([0,0, -(height/2)-.1]) hexagon_prism(4.1,4.7); //Nut Trap hole
	translate([0,0,-(height/2)+3.9]) cylinder(4,4,3); 
}

union() {
	Rgear();
	translate([dia+gap-3,-3,-(height/2) ]) cube([.7,6,height]);
}

