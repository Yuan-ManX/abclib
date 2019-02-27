//--------------------------------------------------------------------------------------//
//PHASOR WITH PHASE FUNCTION
//--------------------------------------------------------------------------------------//
phasorWithPhase(f, p) = (1-vn) * x + vn * p
with {
		vn = (f == 0);//to manage the case where frequency is zero//
		x = (os.phasor(1, f), p, 1) : (+, _) : fmod;
};

//--------------------------------------------------------------------------------------//
//CONTROL PARAMETERS FOR THE ENCODER
//--------------------------------------------------------------------------------------//
rotfreq = hslider("v:encoder/rotationspeed [unit:s-1]", 0, -1000, 1000, 0.001);
rotphase = hslider("v:encoder/defaultangle [unit:deg]", 0, -360, 360, 0.01) / 360;


//--------------------------------------------------------------------------------------//
//PHASOR WITH PHASE TO RADIAN ANGLE CONVERSION
//--------------------------------------------------------------------------------------//
phasedAngle(f, p) = phasorWithPhase(f, p) * 2 * ma.PI;

//--------------------------------------------------------------------------------------//
//SELECTING AN ENCODER FROM HO FAUST LIBRARY
//--------------------------------------------------------------------------------------//
myEncoder(sig, angle) = ho.encoder(ao, sig, angle);//at ambisonic order ao.             //

//--------------------------------------------------------------------------------------//
//SENDING THE PHASED ANGLE FUNCTION TO THE ENCODER
//--------------------------------------------------------------------------------------//
freqPhaseEncoder(f, p) = (_, phasedAngle(f, p)) : myEncoder;