/*
 *    based on:
 *    polyTests.scad    by aubenc @ Thingiverse
 *    adapted to test:
 *    metric_iso_screw_test.scad  by stth
 *
 * This script contains few examples to show how to use the modules
 * included in the library script: 	polyScrewThead_r1_iso.scad
 *
 * http://www.thingiverse.com/thing:8796
 * http://www.thingiverse.com/thing:269863
 *
 * CC Public Domain
 */
use <metric_iso_screw.scad>


// old examples below (still work!)

// new examples
/*
 * creates a screw with hex head an iso thread
 * the fillet in the valleys is not round but a flat.
 * it has the same depht as the lowest part of the round would have.
 *
 * @param d    ISO diameter M<od>
 *             using values between the standardised diameters
 *             may result in strange measures for the width across flat (tool size)
 * @param lt   length of thread
 * @param cs   create cone-cut at the end of thread (for easier handling)
 *             --   -1  only on the head side of the thread
 *             --    0  none
 *             --    1  only at the end of the screw
 *             --    2  at both ends if the thread
 * @param ntl  length of the part between head and upper end of thread
 * @param ntd  diameter  of the part between head and upper end of thread
 *             --  > 0  explicit diameter
 *             --    0  use value of parameter od
 *             --   -1  use diameter of the thread valleys
 * @param hg   height of the head,
 * @param $fn  should be 30 minimum (do not use $fs or $fa)
 ,*/
ORING_OD = 55.5;
ORING_ID = 43.5;
ORING_HEIGHT = 5.5;
 union() {
 difference()
{
//rotate(30,[0,0,1])
    union() {
translate([0,0,55])
hex_screw_iso(
		d=36,
		lt=24,
		cs=2,
		ntl=42,
		ntd=0,
		hg=0,
		$fn=60
	);
translate([-18,0,30])
rotate(90,[0,1,0])
cylinder(h=28,r1=30,r2=30,center=false);
     translate([0,0,72])
     cylinder(h=20,r1=17,r2=25,center=false);
    }
translate([0,0,40])
    cylinder(
        h=100,
        r1=10,
        r2=10,
        center=false);
translate([0,-20,10])
    cube([50,40,40]);
    
}

//1st mounting post
union() {
translate([0,-10.5, 20])
rotate(90,[0,1,0])
cylinder(h=6,r1=2.5,r2=2.5,center=false);
translate([0,-10.5, 20])
rotate(90,[0,1,0])
cylinder(h=9,r1=1,r2=1,center=false);
}

//2nd mounting post
union() {
translate([0,10.5, 20])
rotate(90,[0,1,0])
cylinder(h=6,r1=2.5,r2=2.5,center=false);
translate([0,10.5, 20])
rotate(90,[0,1,0])
cylinder(h=9,r1=1,r2=1,center=false);
}

//3rd mounting post
union() {
translate([0,10.5, 32.5])
rotate(90,[0,1,0])
cylinder(h=6,r1=2.5,r2=2.5,center=false);
translate([0,10.5, 32.5])
rotate(90,[0,1,0])
cylinder(h=9,r1=1,r2=1,center=false);
}

//4th mounting post
union() {
translate([0,-10.5, 32.5])
rotate(90,[0,1,0])
cylinder(h=6,r1=2.5,r2=2.5,center=false);
translate([0,-10.5, 32.5])
rotate(90,[0,1,0])
cylinder(h=9,r1=1,r2=1,center=false);
}

//mounting cylinder for plexiglass plate
difference() {
translate([5,0,30])
rotate(90,[0,1,0]) {
//cylinder(h=25,r1=30,r2=30,center=false);
hex_screw_iso(
		d=74,
		lt=25,
		cs=2,
		ntl=0,
		ntd=0,
		hg=0,
		$fn=60
	);    
}
translate([4,0,30])
rotate(90,[0,1,0])
cylinder(h=47,r1=20,r2=20,center=false);
translate([30-ORING_HEIGHT/2,0,30])
rotate(90,[0,1,0])
difference() {
    cylinder(h=ORING_HEIGHT/2+1,d1=ORING_OD,d2=ORING_OD,center=false);
  cylinder(h=ORING_HEIGHT/2+1,d1=ORING_ID,d2=ORING_ID,center=false);
}
translate([4,-32,-20])
cube([50,64,20]);

}
}


