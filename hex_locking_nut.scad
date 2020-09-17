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
hex_nut_iso(
		d=36,
		hg=12,
		$fn=60
	);

