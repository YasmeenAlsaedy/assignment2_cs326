#!/bin/bash
#SBATCH --job-name=ColorANDCutout
#SBATCH --gres=gpu:4
#SBATCH --cpus-per-task=40
#SBATCH --time=72:00:00

module load gcc/6.4.0

cd /ibex/scratch/alsaedyy/cs326_projects/assignment2_cs326/DiffAugment-biggan-cifar

python train.py --experiment_name DiffAugment-biggan-cifar10-ColorANDCutout-0.05 --DiffAugment color,cutout \
--mirror_augment --use_multiepoch_sampler \
--which_best FID --num_inception_images 10000 \
--shuffle --batch_size 80 --parallel \
--num_G_accumulations 1 --num_D_accumulations 1 --num_epochs 5000 --num_samples 2500 \
--num_D_steps 4 --G_lr 2e-4 --D_lr 2e-4 \
--dataset C10 \
--G_ortho 0.0 \
--G_attn 0 --D_attn 0 \
--G_init N02 --D_init N02 \
--ema --use_ema --ema_start 1000 \
--test_every 4000 --save_every 2000 --seed 0
