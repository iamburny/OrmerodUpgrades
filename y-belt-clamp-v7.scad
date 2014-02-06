$fn=200;
thick=3;
btmHole=5;
topHole=17;
h=24; //height

module cornerBrace(x,y,z) {
	polyhedron(
		points = [[0,0,0], [x,0,0], [0,y,0], [0,0,z], [x,0,z], [0,y,z]],
		triangles = [[0,2,1], [3,4,5], [0,3,5], [0,5,2], [1,4,3], [1,3,0], [2,5,4], [2,4,1]]
	);
} 
module tooth() {
	x = 1.3;
	y = 7;
	z= 0.75;
	a = 0.4;

	polyhedron(
		points=[[0,0,0] , [a,0,z] , [x-a,0,z] , [x,0,0] ,[0,y,0] , [a,y,z] , [x-a,y,z] , [x,y,0]],
		triangles=[[3,4,0],[3,7,4],  [1,5,2],[2,5,6],  [0,1,2],[0,2,3], [0,4,5], [0,5,1],  [7,6,5], [7,5,4],  [3,2,6], [3,6,7]
		]);
}
module backPlate(holeRad=2) {
	//back with 2 holes
	difference() { 
		union() {
		hull() {
			translate([thick,0,0]) cube([21,thick,h]);
			translate([1.5,1.5,0]) cylinder(h,1.5,1.5);
		}
		hull() {
			translate([0,-12,0]) cube([thick,12,h]);
			translate([1.5,1.5,0]) cylinder(h,1.5,1.5);
		}
		translate([3,-8,9]) rotate([-90,-90,0]) cornerBrace(4,4,2);		
		}
		union() {
			translate([16,4,btmHole]) rotate([90,0,0]) cylinder(thick+2,holeRad,holeRad); //screw hole
			translate([16,4,topHole]) rotate([90,0,0]) cylinder(thick+2,holeRad,holeRad); 
		}
	}
		rotate([0,0,-90]) translate([0,0,22]) cornerBrace(12,12,2);
}

module trapLeft (gap=1.5) {
	translate ([thick,-12,btmHole-4.25-(gap/2)]) cube([7,12,4.25]); //trap bottom
	hull() {
		translate ([thick,-12,btmHole+1.5+(gap/2)]) cube([7,10.5,2.5]);	//trap top
		translate ([thick,-10.5,btmHole+1.5+(gap/2)])  rotate([0,90,0]) cylinder(7,1.5,1.5);
		translate ([thick,-3.5,btmHole+1.5+(gap/2)]) rotate([0,90,0]) cylinder(7,1.5,1.5);
	}
	
	for (i = [0:4]) {
		translate([10,-12+(i*2),4.25]) {
			rotate([0,0,90]){
				tooth();
			}
		}
	}
}

module trapRight(gap=1.5) {
	rotate( [0,180,0])  translate([-13,0,-10]) {
	//hull() {
		translate ([thick,-12,btmHole-4-(gap/2)]) cube([7,9,4]); //trap bottom
		translate ([thick,-3,btmHole-3+(gap/2)])  rotate([0,90,0]) cylinder(7,1.5,1.5);
		translate ([thick,-3,btmHole-3+(gap/2)])  rotate([0,90,0]) cube([2.5,1.5,10]);
	//}
	hull() {
		translate ([thick,-12,btmHole+1.75+(gap/2)]) cube([9,12,2.5]);	//trap top
		translate ([thick,-10.5,btmHole+1.5+(gap/2)])  rotate([0,90,0]) cylinder(7,1.5,1.5);
		translate ([thick,-1,btmHole+1.5+(gap/2)]) rotate([0,90,0]) cube([1.5,1.5,10]);
	}
	
	for (i = [0:4]) {
		translate([10,-12+(i*2),4.25]) {
			rotate([0,0,90]){
				tooth();
			}
		}
	}
	}
}

rotate([0,-90,0]) {			
	//Left	Hand	
	backPlate();
	trapLeft();


	//Right Hand
	translate([0,10,0]) {
		mirror([0,1,0])  {
		backPlate();
		trapRight();
		}
	}
}
