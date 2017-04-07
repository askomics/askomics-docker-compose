# askomics-docker-compose
Deployment of AskOmics/Virtuoso


## Configuration

Update the `VIRT_Parameters_NumberOfBuffers` and `VIRT_Parameters_MaxDirtyBuffers` environments according to how much memory do you want to allow to Virtuoso:

| Memory available (GB) | NumberOfBuffers | MaxDirtyBuffers |
|-----------------------|-----------------|-----------------|
| 2                     | 170000          | 130000          |
| 4                     | 340000          | 250000          |
| 6                     | 510000          | 375000          |
| 8                     | 680000          | 500000          |
| 16                    | 1360000         | 1000000         |
| 32                    | 2720000         | 2000000         |
| 48                    | 4000000         | 3000000         |
| 64                    | 5450000         | 4000000         |

