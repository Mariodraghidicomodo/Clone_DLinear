if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

if [ ! -d "./logs/LongForecasting/univariate" ]; then
    mkdir ./logs/LongForecasting/univariate
fi
seq_len=192
label_len=96
pred_len=48

python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/final_15min_df_poi/ \
  --data_path frequency_15min_df_49_year2019.csv \
  --model_id freq_df_49_year2019_15min_$seq_len'_'$pred_len'_'$label_len'_'S \
  --model DLinear \
  --data custom \
  --features S \
  --target frequency \
  --freq 15min \
  --patience 10\
  --train_epochs 100 \
  --seq_len $seq_len \
  --label_len $label_len \
  --pred_len $pred_len \
  --des 'Exp' \
  --itr 1 --batch_size 30 --feature S --learning_rate 0.005 >logs/LongForecasting/DLinear_freq_df_49_year2019_15min_Arena_$seq_len'_'$pred_len'_'$label_len'_'S
