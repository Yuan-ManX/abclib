//
//--------------------------------------------------------------------------------------//
//MULTI CHANNEL GAINS
//--------------------------------------------------------------------------------------//
//
import("stdfaust.lib");
//
//uses abcdbcontrol.dsp
//
//--------------------------------------------------------------------------------------//
//CONTROL PARAMETER: GAIN IN DB
//--------------------------------------------------------------------------------------//
gain = hslider("v:gains/gain [unit:dB]", 0, -127, 18, 0.01) : dbtogain;

//--------------------------------------------------------------------------------------//
// GAIN LINES IN PARALLEL
//--------------------------------------------------------------------------------------//
gainLine(n) = par(i, n, *(gain));
//