FUNCTION_BLOCK fb_sunpackerCommand

VAR_INPUT
	command : WORD;
END_VAR

VAR_OUTPUT
	source : BYTE;
	parametr : BYTE;
	cmd : BYTE;
END_VAR





cmd := WORD_TO_BYTE(command and 16#7);
parametr := WORD_TO_BYTE(SHR((command and 16#1FF8), 3));
source := WORD_TO_BYTE(SHR(command, 13));