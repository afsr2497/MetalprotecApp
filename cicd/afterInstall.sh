sudo apt install -y python3-pip
sudo apt install -y virtualenv
sudo mkdir -pv /var/{log,run}/gunicorn/
sudo chown -cR ubuntu:ubuntu /var/{log,run}/gunicorn/
virtualenv /home/ubuntu/env
source /home/ubuntu/env/bin/activate
pip install -r /home/ubuntu/MetalprotecApp/requirements.txt
gunicorn -c /home/ubuntu/MetalprotecApp/config/gunicorn/dev.py