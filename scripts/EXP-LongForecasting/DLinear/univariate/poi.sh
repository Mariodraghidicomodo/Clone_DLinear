if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/LongForecasting" ]; then
    mkdir ./logs/LongForecasting
fi

if [ ! -d "./logs/LongForecasting/univariate" ]; then
    mkdir ./logs/LongForecasting/univariate
fi
seq_len=168
pred_len=4
label_len=24

python -u run_longExp.py \
  --is_training 1 \
  --root_path ./dataset/final_df_poi/ \
  --data_path freq_mini.csv \
  --model_id freq_mini_$seq_len'_'$pred_len'_'MS \
  --model DLinear \
  --data custom \
  --features MS \
  --target frequency \
  --freq h \
  --seq_len $seq_len \
  --label_len $label_len \
  --pred_len $pred_len \
  --enc_in 1 \
  --dec_in 1 \
  --c_out 1 \
  --des 'Exp' \
  --itr 1 --batch_size 8 --feature S --learning_rate 0.005 >logs/LongForecasting/DLinear_freq_mini_$seq_len'_'$pred_len'_'MS
