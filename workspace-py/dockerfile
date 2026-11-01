FROM dhi.io/debian-base:trixie-dev@sha256:9e479c64f8d27f8fa368ef62804c2ddb9b3e43a68c13a200b2f668b4771b049e
ENV LANG=C.UTF-8

COPY --from=startown/zsh:5.9@sha256:1851f696fdf459eb485478f4ad18ffc157b4d33e9ce9ae1730bd4f756d5cab14 /opt/zsh /
COPY --from=startown/uv:0.13.6@sha256:6a85d9c5f6527bcc03f209c9655d57d2e68377ec447d0d0a610fb1967d4b43a7 /opt/uv/bin/ /usr/local/bin/
COPY --from=startown/jj:0.46.0@sha256:904a9de67b2268dd7fa79142287f116d7c0a541c54a950e56e79eae419c9d7f6 /opt/jj/bin/jj /usr/local/bin/jj

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      btop=1.3.2-0.1 \
      git=1:2.47.3-0+deb13u1+dhi2 \
      openssh-client=1:10.0p1-7+deb13u4+dhi1 \
      tree=2.2.1-1+deb13u0+dhi0 && \
    rm -rf /var/lib/apt/lists/*

RUN uv python install 3.14.10 && \
    rm -rf \
      /root/.local/share/uv/python/cpython-3.14*/lib/python3.14/ensurepip \
      /root/.local/share/uv/python/cpython-3.14*/lib/python3.14/site-packages/pip*

WORKDIR /root
ENTRYPOINT ["/usr/bin/zsh"]
