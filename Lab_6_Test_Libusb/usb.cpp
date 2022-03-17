#include <iostream> 
#include <libusb.h>
#include <stdio.h> 
#include <stdlib.h>
#include <string.h>

using namespace std;

void printdev(libusb_device* dev);

int main() {
    libusb_device** devs; // указатель на указатель на устройство, 
                          // используетс¤ дл¤ получени¤ списка устройств 
    libusb_context* ctx = NULL; // контекст сессии libusb 
    ssize_t cnt;         // число найденных USB-устройств 
    ssize_t i;           // индексна¤ переменна¤ цикла перебора всех устройств 
    
    if (libusb_init(&ctx) < 0) { // инициализировать библиотеку libusb, открыть сессию работы с libusb
        fprintf(stderr, "Ошибка: инициализация не выполнена.\n");
        return 1;
    }
    // задать уровень подробности отладочных сообщений 
    libusb_set_debug(ctx, 3);
    // получить список всех найденных USB- устройств
    cnt = libusb_get_device_list(ctx, &devs);
    if (cnt < 0) {
        fprintf(stderr, "Ошибка: список USB устройств не получен.\n");
        return 1;
    }
    printf("devices found: %d\n", (int)cnt);
    printf("===========================================================\n");
    printf("* NumConfigurations\n");
    printf("|  * DeviceClass\n");
    printf("|  |   * idVendor\n");
    printf("|  |   |     * idProduct\n");
    printf("|  |   |     |     * serialNumber      *NumInterfaces\n");
    printf("|  |   |     |     |                   |   *NumAlternativeSetting\n");
    printf("|  |   |     |     |                   |   |  * InterfaceNumber\n");
    printf("|  |   |     |     |                   |   |  |  * NumEndpoints\n");
    printf("|  |   |     |     |                   |   |  |  |  * DescriptorType\n");
    printf("|  |   |     |     |                   |   |  |  |  |  * EndpointAddress\n");
    printf("+--+---+-----+-----+-------------------+---+--+--+--+--+----------------------\n");
    for (i = 0; i < cnt; i++) {  // цикл перебора всех устройств 
        printdev(devs[i]);        // печать параметров устройства 
    }
    printf("=======================================================================\n");
    // освободить пам¤ть, выделенную функцией получени¤ списка устройств 
    libusb_free_device_list(devs, 1);
    libusb_exit(ctx);           // завершить работу с библиотекой libusb, 
                                // закрыть сессию работы с libusb 
    return 0;
}

void printdev(libusb_device* dev) {
    libusb_device_descriptor desc;    // дескриптор устройства 
    libusb_config_descriptor* config; // дескриптор конфигурации объекта 
    const libusb_interface* inter;
    const libusb_interface_descriptor* interdesc;
    const libusb_endpoint_descriptor* epdesc;
    if (libusb_get_device_descriptor(dev, &desc) < 0) {
        fprintf(stderr, "Ошибка: дескриптор устройства не получен.\n");
        return;
    }
    libusb_get_config_descriptor(dev, 0, &config); // получить конфигурацию устройства

    unsigned char data[20] = {' '};

    libusb_device_handle* DeviceHandle;
    libusb_open(dev, &DeviceHandle);

    printf("|--|---|-----|-----|-------------------|---|--|--|--|--|----------------------\n");

    libusb_get_string_descriptor_ascii(DeviceHandle, desc.iManufacturer, data, 20);
    printf("Device: %s ", data);
    libusb_get_string_descriptor_ascii(DeviceHandle, desc.iProduct, data, 20);
    printf("%s\n", data);

    printf("|--|---|-----|-----|-------------------|---|--|--|--|--|----------------------\n");

    libusb_get_string_descriptor_ascii(DeviceHandle, desc.iSerialNumber, data, 20);
    printf("%s\n", data);

    libusb_close(DeviceHandle);



    while (strlen((char*)data) < 19)
 data[strlen((char*)data)] = ' ';

    printf("%.2d %.3d %.5d %.5d %s %.3d |  |  |  |  |\n",
        (int)desc.bNumConfigurations,
        (int)desc.bDeviceClass,
        desc.idVendor,
        desc.idProduct,
        data,
        (int)config->bNumInterfaces
    );
    for (int i = 0; i < (int)config->bNumInterfaces; i++) {
        inter = &config->interface[i];
        printf("|  |   |     |     |                   |   %.2d |  |  |  |\n",
            inter->num_altsetting
        );
        for (int j = 0; j < inter->num_altsetting; j++) {
            interdesc = &inter->altsetting[j];
            printf("|  |   |     |     |                   |   |  %.2d %.2d |  |\n",
                (int)interdesc->bInterfaceNumber,
                (int)interdesc->bNumEndpoints
            );
            for (int k = 0; k < (int)interdesc->bNumEndpoints; k++) {
                epdesc = &interdesc->endpoint[k];
                printf(
                    "|  |   |     |     |                   |   |  |  |  %.2d %.9d\n",
                    (int)epdesc->bDescriptorType,
                    (int)(int)epdesc->bEndpointAddress
                );
            }
        }
    }
    libusb_free_config_descriptor(config);
}
