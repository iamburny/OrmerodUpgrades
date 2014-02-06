$fn=100;
x = 25;
y = 18;
z=10;
ts = 2; //top smaller by
r = 5; //hole rad

difference() {

	polyhedron(
		points = [[0,0,0], [x/4,y/2,0],[0,y,0],[x,y/2,0],[ts,ts,z],[(x/4)+(ts/2),y/2,z],[ts,y-ts,z],[x-ts,y/2,z]],
		triangles = [[0,4,7],[0,7,3],[1,5,4],[1,4,0],[2,6,5],[2,5,1],[3,7,6],[3,6,2],[2,1,3],[1,0,3],[4,5,7],[5,6,7]	]);
	translate([(x/2)-(ts/2),(y/2),-.1]) cylinder(z+.2, r/2,r/2);
}