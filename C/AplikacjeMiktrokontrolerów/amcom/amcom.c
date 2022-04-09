#include <string.h>
#include <stdint.h>
#include <stdio.h>
#include "amcom.h"

/// Start of packet character
const uint8_t  AMCOM_SOP         = 0xA1;
const uint16_t AMCOM_INITIAL_CRC = 0xFFFF;

static uint16_t AMCOM_UpdateCRC(uint8_t byte, uint16_t crc)
{
	byte ^= (uint8_t)(crc & 0x00ff);
	byte ^= (uint8_t)(byte << 4);
	return ((((uint16_t)byte << 8) | (uint8_t)(crc >> 8)) ^ (uint8_t)(byte >> 4) ^ ((uint16_t)byte << 3));
}


void AMCOM_InitReceiver(AMCOM_Receiver* receiver, AMCOM_PacketHandler packetHandlerCallback, void* userContext) {
    receiver->packetHandler = packetHandlerCallback;
    receiver->userContext = userContext;
    receiver->payloadCounter = 0;
    receiver->receivedPacketState = AMCOM_PACKET_STATE_EMPTY;
}

size_t AMCOM_Serialize(uint8_t packetType, const void* payload, size_t payloadSize, uint8_t* destinationBuffer) {
    if((payloadSize>200)||((payloadSize==0)&&(payload!=NULL))||((payloadSize!=0)&&(!(payload)))){
        return 0;
    }
	uint16_t crc = AMCOM_INITIAL_CRC;
	destinationBuffer[0]=AMCOM_SOP;
	destinationBuffer[1]=packetType;
	crc = AMCOM_UpdateCRC(packetType,crc);
	destinationBuffer[2]=payloadSize;
	crc = AMCOM_UpdateCRC(payloadSize,crc);
	if(payloadSize==0){
	    destinationBuffer[3]=((uint8_t)(crc & 0x00ff));
	    destinationBuffer[4]=((uint8_t)((crc & 0xff00)>>8));
	    return 5;
	}
	else{
	    const uint8_t* data = (const uint8_t*)payload;
	    for(size_t i = 0;i<payloadSize;i++){
	    destinationBuffer[i+5]=data[i];
	    crc = AMCOM_UpdateCRC(data[i],crc);
	    }
	    destinationBuffer[3]=((uint8_t)(crc & 0x00ff));
	    destinationBuffer[4]=((uint8_t)((crc & 0xff00)>>8));
	    return (5+payloadSize);
	}
}

void AMCOM_Deserialize(AMCOM_Receiver* receiver, const void* data, size_t dataSize) {
    const uint8_t* d = (const uint8_t*)data;
    for(size_t i = 0;i<dataSize;i++){
        switch(receiver->receivedPacketState){
            case AMCOM_PACKET_STATE_EMPTY:{
                if(d[i]==AMCOM_SOP){
                    receiver->receivedPacket.header.sop = d[i];
                    receiver->receivedPacketState = AMCOM_PACKET_STATE_GOT_SOP;
                }
                break;
            }
	        case AMCOM_PACKET_STATE_GOT_SOP:{
	            receiver->receivedPacket.header.type = d[i];
	            receiver->receivedPacketState = AMCOM_PACKET_STATE_GOT_TYPE;
	            break;
	        }
	        case AMCOM_PACKET_STATE_GOT_TYPE:{
	            if(d[i]<=200){
	                receiver->receivedPacket.header.length = d[i];
	                receiver->receivedPacketState = AMCOM_PACKET_STATE_GOT_LENGTH;
	            }
	            else{
	                receiver->receivedPacketState = AMCOM_PACKET_STATE_EMPTY;
	            }
	            break;
	        }
	        case AMCOM_PACKET_STATE_GOT_LENGTH:{
	            receiver->receivedPacket.header.crc = ((uint16_t)(d[i]));
	            receiver->receivedPacketState = AMCOM_PACKET_STATE_GOT_CRC_LO;
	            break;
	            
	        }
	        case AMCOM_PACKET_STATE_GOT_CRC_LO:{
	            receiver->receivedPacket.header.crc = ((((uint16_t)(d[i])) << 8) | receiver->receivedPacket.header.crc);
	            if(receiver->receivedPacket.header.length == 0){
	                receiver->receivedPacketState = AMCOM_PACKET_STATE_GOT_WHOLE_PACKET;
	                dataSize++;
	            }
	            else{
	                receiver->receivedPacketState = AMCOM_PACKET_STATE_GETTING_PAYLOAD;
	            }
	            break;
	        }
	        case AMCOM_PACKET_STATE_GETTING_PAYLOAD:{
	            receiver->receivedPacket.payload[receiver->payloadCounter]=d[i];
	            receiver->payloadCounter++;
	            if(receiver->payloadCounter==receiver->receivedPacket.header.length){
	                receiver->receivedPacketState = AMCOM_PACKET_STATE_GOT_WHOLE_PACKET;
	                dataSize++;
	            }
	            break;
	        }
	        case AMCOM_PACKET_STATE_GOT_WHOLE_PACKET:{
	            uint16_t crc = AMCOM_INITIAL_CRC;
	            crc = AMCOM_UpdateCRC(receiver->receivedPacket.header.type,crc);
	            crc = AMCOM_UpdateCRC(receiver->receivedPacket.header.length,crc);
	            for(size_t i = 0;i<receiver->payloadCounter;i++){
	                crc = AMCOM_UpdateCRC(receiver->receivedPacket.payload[i],crc);
	            }
	            if(crc == receiver->receivedPacket.header.crc){
	                
	                receiver->packetHandler(&receiver->receivedPacket,receiver->userContext);
	            }
	            receiver->receivedPacketState = AMCOM_PACKET_STATE_EMPTY;
	            receiver->payloadCounter=0;
	            break;
	        }
        }
    }
}
