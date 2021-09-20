# QuickLogic EOS S3 MCU/eFPGA Board

This sample uses the MCU to generate the clocks (25Mhz) that is fed into the FPGA macro and controls the pin allocations that are made available to the FPGA. The MCU code is based on FreeRTOS SDK provided by the [Qorc SDK](https://github.com/QuickLogic-Corp/qorc-sdk)

The FPGA itself is programmed with the Verilog files from [ChiselBlinky](https://github.com/carlosedp/chisel-playground/tree/master/blinky) sample generated thru FuseSoc. Here I already included the generated Verilog files into the `fpga/rtl` dir.

<details><summary>Generating the Verilog files</summary>
To generate the Verilog files from the Chisel sources, follow the Readme instructions from [here](https://github.com/carlosedp/chisel-playground/tree/master/blinky#building) and use the command `EDALIZE_LAUNCHER=$(realpath ./runme.py) fusesoc run --target=qomu carlosedp:demo:chiselblinky:0` if using the Docker container.
</details>

## Build toolchain Docker image

This builds the Docker image containing the complete toolchain for the eFPGA based on the open-source Symbiflow project and the ARM toolchain to build binaries for the ARM Cortex®-M4F MCU.

```sh
docker build -t carlosedp/symbiflow:eos-s3 -f Dockerfile.symbiflow-eos .
```

## Generating the bitstream and programming file

The bitstream and MCU file is generated using the Docker image containing the toolchain.

```sh
docker run -it -v $(pwd):/home/ql/data --rm docker.io/carlosedp/symbiflow:eos-s3 bash
export BOARD=qomu
cd data/GCC_Project
make

# You can type `exit` after it finishes
```

The output files will be placed on `./GCC_Project/output`.


## Programming

Plug the Qomu into the USB port and while it blinks blue, touch the edge connector. It will become a blinking green.

To program the board, clone the [TinyFPGA-Programmer](https://github.com/QuickLogic-Corp/TinyFPGA-Programmer-Application) application and use it (adjusting it's path in command below):

```sh
python3 ../TinyFPGA-Programmer-Application/tinyfpga-programmer-gui.py --mode m4 --port /dev/cu.usbmodem2201 --reset --m4app ./GCC_Project/output/bin/data.bin
```

The board will restart after finished programming.
