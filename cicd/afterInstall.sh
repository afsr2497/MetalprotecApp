sudo apt install -y python3-pip
sudo apt install -y virtualenv
virtualenv /home/ubuntu/env
source /home/ubuntu/env/bin/activate
pip install -r /home/ubuntu/MetalprotecApp/requirements.txt
python3 manage.py runserver 0.0.0.0:8000 &