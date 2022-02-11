set -xe
# Chia directories
CHIA_BLOCKCHAIN=/home/${USER}/chia-blockchain/
CHIA_PLOT_LOGS=/home/${USER}/chia-plot-logs/
CHIA_TEMP=/home/${USER}/chia-temp/
# Chia plots
CHIA_WALLET=  # xch1vfvx8a5w86d2jy28sv93zqdhl42td0wr9x9xlrwaezxf52arrqmsgetzcl
CHIA_STORAGE=/mnt/Chia5TB-4/
# PLOTS_IN_PARALLEL * PLOTS_QUEUE = TOTAL_PLOTS
PLOTS_IN_PARALLEL=3
PLOTS_QUEUE=8
# Chia plot size of k32
# 101.3 GiB final size
# 239   GiB free temp space
PLOTS_K_SIZE=32

# Dedicated Hardware Resources
RAM_TOTAL=5000 # free -m (MiB)
CPU_TOTAL=2 # nproc --all
# Per Plot
PLOT_RAM=$((RAM_TOTAL / PLOTS_IN_PARALLEL))
PLOT_CPU=$((CPU_TOTAL / PLOTS_IN_PARALLEL))

PLOT_CREATE_CMD="chia plots create \
-k ${PLOTS_K_SIZE} \
-n ${PLOTS_QUEUE} \
-b ${PLOT_RAM} \
-r ${PLOT_CPU} \
-t ${CHIA_TEMP} \
-d ${CHIA_STORAGE} \
-c ${CHIA_WALLET}"

# shellcheck source=/home/${USER}/chia-blockchain/venv/bin/activate
source "${CHIA_BLOCKCHAIN}/venv/bin/activate"
mkdir "${CHIA_PLOT_LOGS}" "${CHIA_TEMP}" &&
  chia show -s &&
  chia show -c &&
  chia wallet show &&
  chia plotnft show -i 2

for ((plot = 1; plot <= PLOTS_IN_PARALLEL; plot++)); do
    $PLOT_CREATE_CMD >>"${CHIA_PLOT_LOGS}/plot-${plot}" 2>&1 &
done
