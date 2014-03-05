$fn=100;
bw = 85; //bottom width
tw = 120; //top width
l = 100;//length
h = 30;//height
holeRad = 2.7; 

rotate([-90,0,0]) {
difference() {
	linear_extrude(h) polygon(points=[[-(bw/2),-(l/2)],[-(tw/2),l/2],[tw/2,l/2],[bw/2,-(l/2)]], paths=[[0,1,2,3]]);
	translate([0,0,10]) linear_extrude(10) polygon(points=[[-(bw/2)+10,-(l/2)],[-(tw/2)+10,l/2],[(tw/2)-10,l/2],[(bw/2)-10,-(l/2)]], paths=[[0,1,2,3]]);
	translate([0,0,20]) linear_extrude(10) polygon(points=[[-(bw/2)+20,-(l/2)],[-(tw/2)+20,l/2],[(tw/2)-20,l/2],[(bw/2)-20,-(l/2)]], paths=[[0,1,2,3]]);
	
	//bottom screw hole
	translate([0,-20,-1]) cylinder(12, holeRad, holeRad);
	translate([0,-20,5]) cylinder(6, holeRad, holeRad*2.5);
	
	//top screw hole
	translate([0,20,-1]) cylinder(12, holeRad, holeRad);
	translate([0,20,5]) cylinder(6, holeRad, holeRad*2.5);
}
}