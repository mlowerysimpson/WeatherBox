/*
 *    based on:
 *    polyTests.scad    by aubenc @ Thingiverse
 *    adapted to test:
 *    metric_iso_screw_test.scad  by stth
 *  see:
 * http://www.thingiverse.com/thing:8796
 * http://www.thingiverse.com/thing:269863
 *
 * CC Public Domain
 */
use <metric_iso_screw.scad>
CIRCLE_DIA1 = 90;
CIRCLE_DIA2 = 42;
CIRCLE_HEIGHT = 3;

/*
 * creates a hex nut with an iso thread
 * the fillet in the valleys is not round but a flat.
 * it has the same depth as the lowest part of the round would have.
 *
 * @param d    ISO diameter M<od>
 *             using values between the standardised diameters
 *             may result in strange measures for the width across flat (tool size)
 * @param hg   height of the head,
 * @param $fn  should be 30 minimum (do not use $fs or $fa)
 */

//translate([40,0,1])
union() {
difference() {
  cylinder(h=CIRCLE_HEIGHT,d1=CIRCLE_DIA1,d2=CIRCLE_DIA1,center=false);
  translate([0,0,-1])
  cylinder(h=CIRCLE_HEIGHT+2,d1=CIRCLE_DIA2,d2=CIRCLE_DIA2,center=false);
}   
translate([0,0,CIRCLE_HEIGHT])
difference() {
hex_nut_iso(
		d=80,
		hg=18,
		$fn=60
	);
    translate([0,0,-1])
difference() {
    cylinder(h=20,d1=120,d2=120,center=false);
    cylinder(h=20,d1=90,d2=90,center=false);
}
}
}