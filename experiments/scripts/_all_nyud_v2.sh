#!/bin/bash
./experiments/scripts/train_rcnn_ao_nyud_v2_40gupta.sh 0 _rgb nyud_v2_trainval_rgb nyud_v2_test_rgb 100000
./experiments/scripts/train_rcnn_ao_nyud_v2_40gupta.sh 0 _d_raw_normal_16bits nyud_v2_trainval_d_raw_normal_16bits nyud_v2_test_d_raw_normal_16bits 100000
./experiments/scripts/train_rcnn_ao_nyud_v2_40gupta.sh 0 _d_raw_focus_16bits nyud_v2_trainval_d_raw_focus_16bits nyud_v2_test_d_raw_focus_16bits 100000
./experiments/scripts/train_rcnn_ao_nyud_v2_40gupta.sh 0 _d_raw_focus_8bits nyud_v2_trainval_d_raw_focus_8bits nyud_v2_test_d_raw_focus_8bits 100000
./experiments/scripts/train_rcnn_ao_nyud_v2_40gupta.sh 0 _d_raw_normal_8bits nyud_v2_trainval_d_raw_normal_8bits nyud_v2_test_d_raw_normal_8bits 100000
