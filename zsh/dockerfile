FROM dhi.io/debian-base:trixie-dev@sha256:9e479c64f8d27f8fa368ef62804c2ddb9b3e43a68c13a200b2f668b4771b049e AS build

RUN apt-get update && \
    apt-get download \
      zsh=5.9-8+b24 \
      zsh-common=5.9-8 && \
    for deb in *.deb; do dpkg-deb -x "$deb" /opt/zsh; done

ADD https://github.com/ohmyzsh/ohmyzsh.git#17a2b4c3a5855524ad4772a17ada0dc474e2fdf3 /opt/zsh/usr/share/oh-my-zsh
ADD https://github.com/sindresorhus/pure.git#cac55d0b531a0db72294c9bba9453dfa6374c59d /opt/zsh/usr/share/zsh/pure
COPY .zshrc /opt/zsh/root/.zshrc

FROM dhi.io/debian-base:trixie-dev@sha256:9e479c64f8d27f8fa368ef62804c2ddb9b3e43a68c13a200b2f668b4771b049e
ENV LANG=C.UTF-8

COPY --from=build /opt/zsh /opt/zsh
COPY --from=build /opt/zsh /

ENTRYPOINT ["/usr/bin/zsh"]
