/*
 * COEFFICIENTSHANDLER.h
 *
 *  Created on: Jan 10, 2021
 *      Author: GMateusDP
 */


#ifndef COEFFICIENTSHANDLER_H_
#define COEFFICIENTSHANDLER_H_

#include "system.h"
#include "alt_types.h"
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

#define BLACK_LIST_SIZE	16
#define WHITE_LIST_SIZE	16



class COEFFICIENTS_HANDLER {
public:
	float	*noises;
	float	*resonances;
public:
	COEFFICIENTS_HANDLER();
	virtual ~COEFFICIENTS_HANDLER();
	bool Init_lists(void);

};

#endif /* COEFFICIENTSHANDLER_H_ */
