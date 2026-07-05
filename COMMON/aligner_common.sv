
parameter APB_ADDR_WIDTH = 16;
parameter APB_DATA_WIDTH = 32;
typedef enum bit {APB_READ,APB_WRITE} apb_operation_t;
typedef enum bit {APB_OKAY,APB_ERROR} apb_responce_t;

