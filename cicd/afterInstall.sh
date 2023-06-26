sudo apt install -y python3-pip
sudo apt install -y virtualenv
sudo mkdir -pv /var/{log,run}/gunicorn/
sudo chown -cR ubuntu:ubuntu /var/{log,run}/gunicorn/
virtualenv /home/ubuntu/env
source /home/ubuntu/env/bin/activate
pip install -r /home/ubuntu/MetalprotecApp/requirements.txt
cd /home/ubuntu/MetalprotecApp/
gunicorn -c config/gunicorn/dev.py
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8000