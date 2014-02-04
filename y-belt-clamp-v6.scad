$fn=50;

module fillet(r, h) {
    translate([r / 2, r / 2, 0])

        difference() {
            cube([r + 0.01, r + 0.01, h], center = true);

            translate([r/2, r/2, 0])
                cylinder(r = r, h = h + 1, center = true);

        }
}

module tooth(xpos,ypos,zpos,rot) {
	zHeight = 1.5;
	xLength = 7;
	yDepth = -0.8;
	a = 0.5;

	translate([xpos,ypos,zpos]) {
		rotate([rot,0,0]){
		polyhedron(
			points=[[0,0,0] , [0,0,zHeight] , [xLength,0,zHeight] , [xLength,0,0] ,[0,yDepth,a] , [0,yDepth,(zHeight-a)] , [xLength,yDepth,(zHeight-a)] , [xLength,yDepth,a]],
			triangles=[[0,2,1],[0,3,2], [0,1,4],[1,5,4], [0,4,7],[0,7,3], [4,5,6],[4,6,7], [5,1,6],[6,1,2], [3,7,6],[3,6,2] 
			]);
		}
	}
}

module tooth2(xpos,ypos,zpos,rot) {
	zHeight = 0.6;
	xLength = 7;
	yDepth = 0.8;
	a = 0.5;

	translate([xpos,ypos ,zpos]) {
		rotate([rot+6,0,0]){
			cube([xLength, yDepth, zHeight]);
		}
	}
}

module backPlate(thick, holeRad, height1, trapZpos, r) {
	//back with 2 holes
	difference() { 
		difference() { cube([21,thick,height1]); translate ([-0.10,r,height1/2]) rotate([0,0,-90]) fillet(r, height1+2);}
		union() {
			translate([16,4,trapZpos-5]) rotate([90,0,0]) cylinder(thick+2,holeRad,holeRad);
			translate([16,4,trapZpos+7]) rotate([90,0,0]) cylinder(thick+2,holeRad,holeRad); 
		}
	}
}
module sidePlate(thick, height1, blockH, r) {

	//left side
	union() { translate([0,-12,0]) cube([thick,12,height1]); translate ([2.9,0,19.5]) rotate([0,0,-90]) fillet(r, height1-blockH);}

}
module spiggot(ypos, trapZpos, rad, trapW) {
	//smooth spigot, belt trap
	translate([3, ypos, trapZpos]) rotate([0,90,0]) cylinder(trapW, rad, rad);
}
module outerBlock(spigYpos, spigR, trapGap, trapZpos, trapW, blockH) {
	//outerblock, belt trap
	difference() {
		translate([3,spigYpos, trapZpos-7.5]) cube([trapW,10,blockH]);
		translate([2,spigYpos, trapZpos]) rotate([0,90,0]) cylinder(trapW + 2, spigR + trapGap, spigR + trapGap);
	}
}


r = 3; //chamfer raduis

trapWidth = 8;
spigRad = 4; //radius
trapGap = 1.5;
trapZpos = 10;
spigYpos = -7;

screwHoleRad = 2;
backThick = 3;
sideThick = 3;

Height = 24;
blockHeight = 15;
toothAngleStep = 28;
toothAngleStep2 = toothAngleStep -2;
rotAdjust = 6;
rotAdjustMirror =  85;


rotate([0,-90,0]) {	

//Left	Hand	
translate([0,-10,0]) {
	backPlate(backThick, screwHoleRad, Height, trapZpos, r );
	sidePlate(backThick, Height, blockHeight, r);
	spiggot(spigYpos, trapZpos, spigRad, trapWidth) ;
	outerBlock(spigYpos, spigRad, trapGap, trapZpos, trapWidth, blockHeight) ;

	for (z = [-3 : 3]) {
		color("blue") tooth(
		sideThick, 
		(((spigRad+trapGap ) * cos ((toothAngleStep * z)-rotAdjust)) + spigYpos), 
		(((spigRad+trapGap ) * sin ((toothAngleStep * z)-rotAdjust)) + trapZpos),
		(toothAngleStep * z)-rotAdjust
		);
	}
}

//Right Hand
mirror([0,1,0]) {
	backPlate(backThick, screwHoleRad, Height, trapZpos, r );
	sidePlate(backThick, Height, blockHeight, r);
	spiggot(spigYpos, trapZpos, spigRad, trapWidth) ;
	outerBlock(spigYpos, spigRad, trapGap+0.1, trapZpos, trapWidth, blockHeight) ;

	
	for (z = [0 : 7]) {
		color("red") tooth2(
			sideThick, 
			(((spigRad + 0.8 )* cos ((toothAngleStep2 * z)-rotAdjustMirror)) + spigYpos), 
			(((spigRad  + 0.8 )* sin ((toothAngleStep2 * z)-rotAdjustMirror)) + trapZpos),
			((toothAngleStep2 ) * z) + 168 - rotAdjustMirror
		);
	}
}

}
