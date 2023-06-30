sudo apt install -y python3-pip
sudo apt install -y virtualenv
sudo apt install -y nginx=1.18.*
sudo mkdir -pv /var/{log,run}/gunicorn/
sudo chown -cR ubuntu:ubuntu /var/{log,run}/gunicorn/
virtualenv /home/ubuntu/env
source /home/ubuntu/env/bin/activate
pip install -r /home/ubuntu/MetalprotecApp/requirements.txt
cd /home/ubuntu/MetalprotecApp/
gunicorn -c config/gunicorn/dev.py
python3 manage.py collectstatic
sudo iptables -t nat -D PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8000
sudo systemctl restart nginx