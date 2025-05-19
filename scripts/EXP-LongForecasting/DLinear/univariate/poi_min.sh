if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

if [ ! -d "./logs/LongForecasting/univariate" ]; then
    mkdir ./logs/LongForecasting/univariate
fi
seq_len=96
pred_len=24
label_len=48

python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/final_15min_df_poi/ \
  --data_path frequency_15min_df_61.csv \
  --model_id freq_15min_df_61_$seq_len'_'$pred_len'_'$label_len'_'MS \
  --model DLinear \
  --data custom \
  --features S \
  --target frequency \
  --freq 15min \
  --train_epochs 100 \
  --seq_len $seq_len \
  --label_len $label_len \
  --pred_len $pred_len \
  --enc_in 1 \
  --dec_in 1 \
  --c_out 1 \
  --des 'Exp' \
  --itr 1 --batch_size 7 --feature S --learning_rate 0.005 >logs/LongForecasting/DLinear_freq_15min_df_61_$seq_len'_'$pred_len'_'$label_len'_'S
