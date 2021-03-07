/*
 * COEFFICIENTSHANDLER.cpp
 *
 *  Created on: Jan 10, 2021
 *      Author: GMateusDP
 */

#include "COEFFICIENTSHANDLER.h"

float default_black_list[]={
		438.0,
		1779,
		3683,
		5023,
		2395,
		1107,
		883,
		2400,
		438.0,
		1779,
		3683,
		5023,
		2115,
		1107,
		827,
		4635
};
float default_white_list[]={
		580.0,
		2600.0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0
};

static float local_black_list[BLACK_LIST_SIZE];
static float local_white_list[WHITE_LIST_SIZE];


COEFFICIENTS_HANDLER::COEFFICIENTS_HANDLER() {
	// TODO Auto-generated constructor stub
	noises=local_black_list;
		resonances=local_white_list;
}

COEFFICIENTS_HANDLER::~COEFFICIENTS_HANDLER() {
	// TODO Auto-generated destructor stub
}

bool COEFFICIENTS_HANDLER::Init_lists(void){
	for (uint8_t var = 0; var < BLACK_LIST_SIZE; ++var) {
		local_black_list[var]=default_black_list[var];

	}
	for (uint8_t var = 0; var < WHITE_LIST_SIZE; ++var) {

		local_white_list[var]=default_white_list[var];
	}
	noises=local_black_list;
	resonances=local_white_list;


	return true;
}


