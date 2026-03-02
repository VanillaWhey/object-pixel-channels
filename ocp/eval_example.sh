# A small example how to run the eval script in the default environment, in a perturbation environment, and with different observations. Other games follow the same pattern. The exact names of the modifications can be found in the paper or under HackAtari.

python scripts/eval.py -g Pong -a models/Pong/0/ppo.cleanrl_model
python scripts/eval.py -g Pong -a models/Pong/0/ppo.cleanrl_model -m lazy_enemy

python scripts/eval.py -g Pong -a models/Pong/0/ppo_object_channels.cleanrl_model -wr object_channels
python scripts/eval.py -g Pong -a models/Pong/0/ppo_object_channels.cleanrl_model -wr object_channels -m lazy_enemy

python scripts/eval.py -g Pong -a models/Pong/0/ppo_opc.cleanrl_model -wr object_channels+pixels
python scripts/eval.py -g Pong -a models/Pong/0/ppo_opc.cleanrl_model -wr object_channels+pixels -m lazy_enemy