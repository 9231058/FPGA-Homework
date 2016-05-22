/*
 * In The Name Of God
 * ========================================
 * [] File Name : main.c
 *
 * [] Creation Date : 22-05-2016
 *
 * [] Created By : Parham Alvani (parham.alvani@gmail.com)
 * =======================================
*/
/*
 * Copyright (c) 2016 Parham Alvani.
*/
#include "xparameters.h"
#include "xgpio.h"


/************************** Constant Definitions *****************************/

/*
 * The following constant maps to the name of the hardware instances that
 * were created in the EDK XPS system.
 */
#define GPIO_PROJECT_P2_ID XPAR_LEDS_POSITIONS_DEVICE_ID

/***************** Macros (Inline Functions) Definitions *********************/

#ifdef PRE_2_00A_APPLICATION

/*
 * The following macros are provided to allow an application to compile that
 * uses an older version of the driver (pre 2.00a) which did not have a channel
 * parameter. Note that the channel parameter is fixed as channel 1.
 */
#define XGpio_SetDataDirection(InstancePtr, DirectionMask) \
        XGpio_SetDataDirection(InstancePtr, LED_CHANNEL, DirectionMask)

#define XGpio_DiscreteRead(InstancePtr) \
        XGpio_DiscreteRead(InstancePtr, LED_CHANNEL)

#define XGpio_DiscreteWrite(InstancePtr, Mask) \
        XGpio_DiscreteWrite(InstancePtr, LED_CHANNEL, Mask)

#define XGpio_DiscreteSet(InstancePtr, Mask) \
        XGpio_DiscreteSet(InstancePtr, LED_CHANNEL, Mask)

#endif

/************************** Function Prototypes ******************************/


/************************** Variable Definitions *****************************/

/*
 * The following are declared globally so they are zeroed and so they are
 * easily accessible from a debugger
 */

XGpio Gpio; /* The Instance of the GPIO Driver */

/*****************************************************************************/
/**
*
* FPGA Project Phase 2
*
* @param	None
*
* @return	XST_FAILURE to indicate that the GPIO Intialisation had failed.
*
******************************************************************************/
int main(void)
{
	u32 data;
	u8 start_state;
	u8 end_state;
	int status;
	int delay;

	/*
	 * Initialize the GPIO driver
	 */
	status = XGpio_Initialize(&Gpio, GPIO_PROJECT_P2_ID);
	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Set the direction for all signals to be inputs;
	 */
	XGpio_SetDataDirection(&Gpio, 1, ~0);
	XGpio_SetDataDirection(&Gpio, 2, 0x03E0);

	/*
	 * Put start state and input string into AXI
	*/
	XGpio_DiscreteWrite(&Gpio, 1, data);
	XGpio_DiscreteWrite(&Gpio, 2, start_state & 0x0F);
	/*
	 * Toggle enable
	*/
	XGpio_DiscreteSet(&Gpio, 1, 5)
	XGpio_DiscreteClear(&Gpio, 1, 5)

	/* Wait a small amount of until FSM done it's work */
	for (delay = 0; delay < 32; delay++);

	/*
	 * Read the end state of the FSM
	*/
	data = XGpio_DiscreteRead(&Gpio, 2);
	end_state = (data & 0x01E0) >> 5;

	return XST_SUCCESS;
}

