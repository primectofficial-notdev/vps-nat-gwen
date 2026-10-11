FROM ubuntu:24.04

RUN apt update && apt install -y openssh-server curl wget git sudo tmate net-tools procps coreutils && rm -rf /var/lib/apt/lists/*

RUN rm -f /etc/legal /etc/update-motd.d/*

RUN echo 'clear' >> /etc/profile && \
    echo 'echo -e "\033[1;31m ██████╗ ██╗    ██╗███╗   ██╗\033[0m"' >> /etc/profile && \
    echo 'echo -e "\033[1;31m██╔════╝ ██║    ██║████╗  ██║\033[0m"' >> /etc/profile && \
    echo 'echo -e "\033[1;33m██║  ███╗██║ █╗ ██║██╔██╗ ██║\033[0m"' >> /etc/profile && \
    echo 'echo -e "\033[1;33m██║   ██║██║███╗██║██║╚██╗██║\033[0m"' >> /etc/profile && \
    echo 'echo -e "\033[1;32m╚██████╔╝╚███╔███╔╝██║ ╚████║\033[0m"' >> /etc/profile && \
    echo 'echo -e "\033[1;32m ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝\033[0m"' >> /etc/profile && \
    echo 'echo "═══════════════════════════════════════════════════════════"' >> /etc/profile && \
    echo 'echo "  VPS ini dibuat oleh: @primeCTofficial"' >> /etc/profile && \
    echo 'echo "═══════════════════════════════════════════════════════════"' >> /etc/profile && \
    echo 'echo "  📢 GWEN STORE - PROVIDER DIGITAL TRUSTED!"' >> /etc/profile && \
    echo 'echo "  ORDER VIA TELEGRAM : @primeCTofficial"' >> /etc/profile && \
    echo 'echo "  WHATSAPP OFFICIAL  : 6281325507265"' >> /etc/profile && \
    echo 'echo "  WEBSITE STORE      : gwenshop.biz.id"' >> /etc/profile && \
    echo 'echo "═══════════════════════════════════════════════════════════"' >> /etc/profile && \
    echo 'echo ""' >> /etc/profile

RUN echo '#!/bin/bash\n\
if [ -n "$ROOT_PASSWORD" ]; then\n\
  echo "root:$ROOT_PASSWORD" | chpasswd\n\
fi\n\
service ssh start\n\
tmate -F\n\
' > /entrypoint.sh && chmod +x /entrypoint.sh

EXPOSE 22
CMD ["/entrypoint.sh"]
