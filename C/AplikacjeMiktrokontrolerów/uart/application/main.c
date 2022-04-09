#include "stm32f4xx_hal.h"
#include "stdio.h"
#include "usart.h"
#include "ring_buffer.h"

int main()
{
  HAL_Init();
	USART_Init();
	USART_WriteString("Hello world\n\r");
	while(1);
}
