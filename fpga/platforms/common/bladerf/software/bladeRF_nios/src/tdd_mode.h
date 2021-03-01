/*
 * vctcxo_init.h
 *
 *  Created on: Dec 20, 2020
 *      Author: root
 */

#ifndef TDD_MODE_H_
#define TDD_MODE_H_


#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#include "ad9361.h"
#include "ad9361_api.h"
#ifdef __cplusplus
extern "C"
{
#endif /* __cplusplus */


bool tdd_mode(struct ad9361_rf_phy *ad9361_phy);

#ifdef __cplusplus
}
#endif /* __cplusplus */
#endif /* VCTCXO_INIT_H_ */
