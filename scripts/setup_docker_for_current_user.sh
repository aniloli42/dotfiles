sudo groupadd -f docker \
&& sleep 1 \
&& sudo usermod -aG docker $USER \
&& sleep 1 \
&& newgrp docker && sleep 1 \
&& groups
