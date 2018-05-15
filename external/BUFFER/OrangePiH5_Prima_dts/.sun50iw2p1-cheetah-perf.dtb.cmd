cmd_arch/arm64/boot/dts/sun50iw2p1-cheetah-perf.dtb := /xspace/OpenSource/GitHubLinux/OrangePi/OrangePiH5/toolchain/gcc-linaro-aarch/bin/aarch64-linux-gnu-gcc -E -Wp,-MD,arch/arm64/boot/dts/.sun50iw2p1-cheetah-perf.dtb.d.pre.tmp -nostdinc -I/xspace/OpenSource/GitHubLinux/OrangePi/OrangePiH5/kernel/arch/arm64/boot/dts -I/xspace/OpenSource/GitHubLinux/OrangePi/OrangePiH5/kernel/arch/arm64/boot/dts/include -I/xspace/OpenSource/GitHubLinux/OrangePi/OrangePiH5/kernel/include -undef -D__DTS__ -x assembler-with-cpp -o arch/arm64/boot/dts/.sun50iw2p1-cheetah-perf.dtb.dts arch/arm64/boot/dts/sun50iw2p1-cheetah-perf.dts ; /xspace/OpenSource/GitHubLinux/OrangePi/OrangePiH5/kernel/scripts/dtc/dtc -O dtb -o arch/arm64/boot/dts/sun50iw2p1-cheetah-perf.dtb -b 0 -i arch/arm64/boot/dts/  -d arch/arm64/boot/dts/.sun50iw2p1-cheetah-perf.dtb.d.dtc.tmp arch/arm64/boot/dts/.sun50iw2p1-cheetah-perf.dtb.dts ; cat arch/arm64/boot/dts/.sun50iw2p1-cheetah-perf.dtb.d.pre.tmp arch/arm64/boot/dts/.sun50iw2p1-cheetah-perf.dtb.d.dtc.tmp > arch/arm64/boot/dts/.sun50iw2p1-cheetah-perf.dtb.d

source_arch/arm64/boot/dts/sun50iw2p1-cheetah-perf.dtb := arch/arm64/boot/dts/sun50iw2p1-cheetah-perf.dts

deps_arch/arm64/boot/dts/sun50iw2p1-cheetah-perf.dtb := \
  arch/arm64/boot/dts/sun50iw2p1.dtsi \
  /xspace/OpenSource/GitHubLinux/OrangePi/OrangePiH5/kernel/include/dt-bindings/interrupt-controller/arm-gic.h \
  /xspace/OpenSource/GitHubLinux/OrangePi/OrangePiH5/kernel/include/dt-bindings/interrupt-controller/irq.h \
  /xspace/OpenSource/GitHubLinux/OrangePi/OrangePiH5/kernel/include/dt-bindings/gpio/gpio.h \
  arch/arm64/boot/dts/sun50iw2p1-clk.dtsi \
  arch/arm64/boot/dts/sun50iw2p1-pinctrl.dtsi \

arch/arm64/boot/dts/sun50iw2p1-cheetah-perf.dtb: $(deps_arch/arm64/boot/dts/sun50iw2p1-cheetah-perf.dtb)

$(deps_arch/arm64/boot/dts/sun50iw2p1-cheetah-perf.dtb):
