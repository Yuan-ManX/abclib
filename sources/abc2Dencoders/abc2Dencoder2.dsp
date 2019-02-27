//--------------------------------------------------------------------------------------//
//----------------------------------------abclib----------------------------------------//
//
//-------------------------------FAUST CODE FOR MIXED MUSIC-----------------------------//
//
//-------------------------------- BY ALAIN BONARDI - 2019 -----------------------------//
//--------------------------------------------------------------------------------------//

declare name "abc2Dencoder2";
declare author "Alain Bonardi";
declare licence "GPLv3";

import("stdfaust.lib");
import("abc2dencoder.dsp");

//--------------------------------------------------------------------------------------//
//HOA ENCODER//
//--------------------------------------------------------------------------------------//
ao = 2; //ambisonic order is 2//


//--------------------------------------------------------------------------------------//
//PROCESS FUNCTION
//--------------------------------------------------------------------------------------//
process = freqPhaseEncoder(rotfreq, rotphase);