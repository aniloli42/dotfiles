bluetoothctl power on && \
  bluetoothctl devices | \
  bluetoothctl connect $(cut -d" " -f 2)
