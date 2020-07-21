FastVDMA
==================

FastVDMA is a DMA controller designed with portability and customizability in mind.
The controller is implemented in `Chisel` and can be generated as a `Verilog` file.


This IP Core was generated using this repository: [FastVDMA](https://github.com/antmicro/fastvdma/tree/b4437beca046dc2cded2832ff05c45278cf58dc7)   
(commit: `b4437beca046dc2cded2832ff05c45278cf58dc7`)

The repository contains build instructions.

This instance of FastVDMA was configured praticularly for HDMI setup.
The DMA is configured by editing the `DMATop.scala` file. 
You can use this snippet, which was used for generating the `DMATop.v` file in this repository:
```
val readerFrontend = Module(new AXI4Reader(DMATop.addrWidth, DMATop.readDataWidth))
val writerFrontend = Module(new AXIStreamMaster(DMATop.addrWidth, DMATop.writeDataWidth))
...
object DMATop {
  val addrWidth = 32
  val readDataWidth = 64
  val writeDataWidth = 64
  val readMaxBurst = 256 
  val writeMaxBurst = 0 
  val reader4KBarrier = true
  val writer4KBarrier = false
  val controlDataWidth = 32
  val controlAddrWidth = 32
  val controlRegCount = 16
  val fifoDepth = 512 
}

```
