//--------------------------------------------------------------------------------------//
//----------------------------------------abclib----------------------------------------//
//
//-------------------------------FAUST CODE FOR MIXED MUSIC-----------------------------//
//
//-------------------------------- BY ALAIN BONARDI - 2019 -----------------------------//
//--------------------------------------------------------------------------------------//

declare name "abc2Ddecoder3_2";
declare author "Alain Bonardi";
declare licence "GPLv3";

import("stdfaust.lib");

//--------------------------------------------------------------------------------------//
//HOA DECODER AT ORDER AO TO NL LOUDSPEAKERS//
//--------------------------------------------------------------------------------------//

//--------------------------------------------------------------------------------------//
//AMBISONIC ORDER AND NUMBER OF LOUDSPEAKERS
//--------------------------------------------------------------------------------------//
ao = 3;
nl = 2;
//--------------------------------------------------------------------------------------//
//DEFINITION OF A SMOOTHING FUNCTION FOR CONTROLLERS
//--------------------------------------------------------------------------------------//
smoothLine = si.smooth(ba.tau2pole(0.1));

//--------------------------------------------------------------------------------------//
// CONVERSION DB=>LINEAR
//--------------------------------------------------------------------------------------//
dbcontrol = _ <: ((_ > -127.0), ba.db2linear) : *;

//--------------------------------------------------------------------------------------//
//CONTROL PARAMETERS: gain in dB, directangles +1/-1
//--------------------------------------------------------------------------------------//
gain = hslider("h:decoderstereo/gain [unit:dB]", 0, -127, 18, 0.01) : smoothLine : dbcontrol;
direct = checkbox("h:decoder/v:global/directangles"); 
//--------------------------------------------------------------------------------------//
//A VECTOR OF GAINS ON THE OUTPUT
//--------------------------------------------------------------------------------------//
gainLine = par(i, nl, *(gain));
leftDispatcher = _<:(*(1-direct), *(direct));
rightDispatcher = _<:(*(direct), *(1-direct));

//--------------------------------------------------------------------------------------//
//DECODING
//--------------------------------------------------------------------------------------//
process = ho.decoderStereo(ao) : gainLine : (leftDispatcher, rightDispatcher) :> (_, _);