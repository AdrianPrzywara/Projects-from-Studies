/* Includes ------------------------------------------------------------------*/
#include <assert.h>
#include "ring_buffer.h"


bool RingBuffer_Init(RingBuffer *ringBuffer, char *dataBuffer, size_t dataBufferSize) 
{
	assert(ringBuffer);
	assert(dataBuffer);
	assert(dataBufferSize > 0);
	
	if ((ringBuffer) && (dataBuffer) && (dataBufferSize > 0)) {
	  ringBuffer->buf = dataBuffer;
	  ringBuffer->size = dataBufferSize;
	  ringBuffer->count = 0;
	  ringBuffer->head = 0;
	  ringBuffer->tail = 0;
	  return true;
	}
	
	return false;
}

bool RingBuffer_Clear(RingBuffer *ringBuffer)
{
	assert(ringBuffer);
	
	if (ringBuffer) {
		for(size_t i = 0; i<ringBuffer->size;i++){
		    ringBuffer->buf[i]=0;
		}
		ringBuffer->count = 0;
		ringBuffer->head = 0;
	    ringBuffer->tail = 0;
		return true;
	}
	return false;
}

bool RingBuffer_IsEmpty(const RingBuffer *ringBuffer)
{
  assert(ringBuffer);
	if(ringBuffer->count) return false;
	else return true;
}

size_t RingBuffer_GetLen(const RingBuffer *ringBuffer)
{
	assert(ringBuffer);
	
	if (ringBuffer) {
		return ringBuffer->count;
	}
	return 0;
	
}

size_t RingBuffer_GetCapacity(const RingBuffer *ringBuffer)
{
	assert(ringBuffer);
	
	if (ringBuffer) {
		return ringBuffer->size;
	}
	return 0;	
}


bool RingBuffer_PutChar(RingBuffer *ringBuffer, char c)
{
	assert(ringBuffer);
	
	if (ringBuffer) {
	    if(ringBuffer->count!=ringBuffer->size){
	        ringBuffer->count++;
	        ringBuffer->buf[ringBuffer->head]=c;
	        ringBuffer->head++;
	        if(ringBuffer->head==ringBuffer->size){
	            ringBuffer->head=0;
	        }
		    return true;
	    }
	}
	return false;
}

bool RingBuffer_GetChar(RingBuffer *ringBuffer, char *c)
{
	assert(ringBuffer);
	assert(c);
	
  if ((ringBuffer) && (c)) {
      if(ringBuffer->count>0){
        *c = ringBuffer->buf[ringBuffer->tail];
		ringBuffer->buf[ringBuffer->tail]=0;
		ringBuffer->count--;
		ringBuffer->tail++;
		if(ringBuffer->tail==ringBuffer->size){
		    ringBuffer->tail=0;
		}
		return true; 
      }
	}
	return false;
}
